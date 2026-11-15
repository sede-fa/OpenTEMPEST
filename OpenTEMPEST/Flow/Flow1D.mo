within OpenTEMPEST.Flow;
model Flow1D "1D finite volume gas flow model with a distributed heat port"
  extends OpenTEMPEST.Flow.BaseClasses.Flow1DBaseClass;
  import SI = Modelica.Units.SI;

  replaceable function fluxInterp =
      OpenTEMPEST.Flow.FluxInterpolators.UDSinterp constrainedby OpenTEMPEST.Flow.FluxInterpolators.DifferencingSchemeInterpBase
    "Differencing scheme for the fluxes at the CV faces (default: first order upwind; LUDSinterp: linear upwind)"
    annotation (choicesAllMatching=true);
  parameter Boolean internalHT=true "set true if you want to model HT phenomena inside the channel, false for HT modelled outside";

  parameter SI.CoefficientOfHeatTransfer h_conv=1 "Heat Transfer Coefficient /W/m2/K" annotation(dialog(enable=internalHT));

  replaceable model HeatTransferModel = OpenTEMPEST.Flow.HeatTransfer.ConstantHTC(alpha0=h_conv)
    constrainedby OpenTEMPEST.Flow.HeatTransfer.PartialHTC
    "Heat transfer coefficient model (used when internalHT = true; default: constant coefficient h_conv)"
    annotation (choicesAllMatching=true, Dialog(enable=internalHT));
  HeatTransferModel htc(final N=N, final Dh=2*Rh) "Heat transfer coefficient model";

  // Vertex Values
  SI.SpecificEnthalpy hvInterp[N] "Interpolated enthalpies at the downstream CV faces";
  SI.SpecificEnthalpy hv[N+1] "specific enthalpy at CV boundary";
  SI.MassFraction xiv[N+1, nSpecies] "Mass fractions in CV";

  // External Heat Transfer
  Real Qext[N] = wall.Q./Ntubes;
  Real Qtot;

//   SI.SpecificHeatCapacity cp[N] = Medium.heatCapacity_cp(Gas[1:N].state);
//   SI.SpecificHeatCapacity cpm = sum(cp)/N;

//   SI.ReynoldsNumber Re[N];
//   SI.DynamicViscosity eta[N];
//   SI.PrandtlNumber Pr[N];

  OpenTEMPEST.Interfaces.DHTVolumes wall(N=N)
                                       "HT through cylindrical wall" annotation (Placement(
        transformation(extent={{-80,30},{80,50}}),iconTransformation(extent={{-80,34},
            {80,50}})));

equation

  // Mass balance - single channel
  dV.*theta[:,1].*der(Gas[:].d) = (mfv[1:N] .- mfv[2:N+1])./Ntubes;

//   for i in 1:N loop
//     Re[i] = (2*Rh*mf[i]/Ntubes)/(Acs*eta[i]); // Re in single channel CV
//     eta[i] = Medium.dynamicViscosity(Gas[i].state);
//     Pr[i] = Medium.prandtlNumber(Gas[i].state);
//   end for;

  // Species Mass balance - single channel
  for i in 1:nSpecies loop
    dV.*theta[:,1].*der(Gas[:].d.*Gas[:].Xi[i]) = (mfv[1:N].*xiv[1:N, i] .- mfv[2:N+1].*xiv[2:N+1, i])./Ntubes;
  end for;

  // Energy Balance - single channel
  Ntubes*dV.*theta[:,1].*der(Gas[:].d.*Gas[:].u) = (mfv[1:N].*hv[1:N] .- mfv[2:N+1].*hv[2:N+1]) .+ wall.Q[:];

  if internalHT then
    for i in 1:N loop
      htc.lambda[i] = Medium.thermalConductivity(Gas[i].state);
      htc.Re[i] = (2*Rh*mf[i]/Ntubes)/(Acs*Medium.dynamicViscosity(Gas[i].state));
      htc.Pr[i] = Medium.prandtlNumber(Gas[i].state);
    end for;
    wall.Q[:] = htc.alpha.*Ntubes.*Aw.*(wall.T[:] - Gas[:].T);
  else
    wall.T[:] = Gas[:].T;
  end if;
  Qtot = sum(wall.Q);

  // Interface interpolation
    // At x=0
  mfv[1] = infl.m_flow;
  xiv[1, :] = infl.Xi_outflow[:];
  xiv[1, :] = inStream(infl.Xi_outflow[:]);
  hv[1] = infl.h_outflow;
  hv[1] = inStream(infl.h_outflow);

  // The mass flow at the faces follows from the mass balance (conservative); the differencing
  // scheme is applied to enthalpy and composition. mf[i] is the mass flow leaving CV i.
  mf = mfv[2:N+1];
  hvInterp = fluxInterp(N, Gas.h, hv[1]);
  hv[2:N+1] = hvInterp;
  for i in 1:nSpecies loop
    xiv[2:N+1, i] = fluxInterp(N, Gas[:].Xi[i], xiv[1, i]);
  end for;

  // Boundary conditions
  outfl.m_flow = -mfv[N+1];
  outfl.Xi_outflow[:] = xiv[N+1, :];
  outfl.h_outflow = hv[N+1];

  annotation (Documentation(info="<html>
<p>1D finite volume model of a gas flow in <code>N</code> control volumes (the first and last one scaled by <code>theta0_1</code>)
with a distributed heat port.</p>
<ul>
<li><b>Differencing:</b> enthalpy and composition at the control volume faces come from the replaceable function
<code>fluxInterp</code> (default first order upwind <code>UDSinterp</code>; <code>LUDSinterp</code> for linear upwind). The mass flow at the faces
follows from the mass balance. This replaces the former <code>LUDS</code> flag.</li>
<li><b>Pressure drop:</b> by default a constant gradient <code>dpdxNom</code>. With <code>useForchheimer = true</code> the Darcy-Forchheimer law
(<a href=\"modelica://OpenTEMPEST.Blocks.Functions.pressureDropForchheimer\">pressureDropForchheimer</a>) is used with <code>kPerm</code> and <code>betaForch</code>.
By default the drop of a whole CV lies upstream of each CV centre and the outlet pressure equals the last CV pressure.
With <code>staggeredPressure = true</code> the pressures sit at the CV centres and each flange gets half a CV of pressure drop.
Combined with the Darcy-Forchheimer option the CV pressures then become states, so they can be given initial values.</li>
<li><b>Heat transfer:</b> the replaceable model <code>HeatTransferModel</code> gives the coefficient (default: constant <code>h_conv</code>, as before;
other choice: <a href=\"modelica://OpenTEMPEST.Flow.HeatTransfer.ConstantNusselt\">ConstantNusselt</a>).</li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-80,34},{80,-32}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.HorizontalCylinder)}),         Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Flow1D;
