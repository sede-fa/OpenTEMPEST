within OpenTEMPEST.SOC.Cell.Cell1D.Components;
model AirChannel "1D air channel with oxygen consumption or production at the PEN"
  extends OpenTEMPEST.SOC.Cell.Cell1D.Components.Channel1DBase(
    pStartOut=(1 - pDrop)*pStartIn,
    redeclare package Medium = OpenTEMPEST.Medium.Air_Medium);

  import SI = Modelica.Units.SI;

  // Pressure Drop
  parameter Real pDrop(max=0.99) "Only used for the start value of the outlet pressure: assumed pressure drop as a factor of the inlet pressure (between 0 and 0.99)";
  parameter SI.Area kPerm = 3e-9 "Permeability of the channel" annotation(Dialog(tab="Pressure drop"));
  parameter Real betaForch(unit="1/m") = 0
    "Forchheimer (inertial) coefficient; 0 gives Darcy's law. For foams and packed beds see the documentation of pressureDropForchheimer"
    annotation(Dialog(tab="Pressure drop"));

  // Kinetics
  SI.MolarFlowRate rEl[N];
  SI.EnergyFlowRate q_electrochem[N] = rEl .* (0.5*H_o2);

protected
  Real a[nSpecies] = {-0.5, 0};

  SI.MolarEnthalpy H_o2[N]=Medium.MMX[1]*Modelica.Media.IdealGases.Common.Functions.h_T(
      T=Q_PEN.T,
      exclEnthForm=false,
      refChoice=Modelica.Media.Interfaces.Choices.ReferenceEnthalpy.ZeroAt25C,
      data=Modelica.Media.IdealGases.Common.SingleGasesData.O2);

equation

  // Energy Balance
  Emg[:] = Gas[:].d.*Gas[:].u.*por*dV;
  QgasExt[:] = Q_PEN.Q[:] + Q_IC.Q[:] .- q_electrochem[:];

  // Reaction kinetics
  massTransfer[:] = -PEN_in[:].I/(4*Modelica.Constants.F)*Modelica.Media.IdealGases.SingleGases.O2.data.MM;
  for i in 1:N loop
    rEl[i] = PEN_in[i].I/(2*Modelica.Constants.F);
    for j in 1:nSpecies loop
      R[i, j] = a[j]*rEl[i]*Medium.MMX[j];
    end for;
  end for;

  // Pressure Drop
  //dp~momentum Balance
  for i in 1:N loop
    dp[i] = OpenTEMPEST.Blocks.Functions.pressureDropForchheimer(
      mfv[i],
      eta[i],
      Gas[i].d,
      dx,
      lZ*lY,
      kPerm,
      betaForch);
  end for;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-84,34},{82,-28}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.HorizontalCylinder), Rectangle(
          extent={{-84,28},{82,12}},
          lineColor={28,108,200},
          fillPattern=FillPattern.CrossDiag,
          fillColor={134,134,134})}),                            Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
One-dimensional finite-volume air channel model extending 
<code>Channel1DBase</code>. The model describes coupled mass, energy, 
and momentum balances in the channel including oxygen electrochemical reaction 
and axial pressure drop.
</p>

<h4>Included Phenomena</h4>
<ul>
<li>Oxygen electrochemical reaction via <code>PEN_in</code></li>
<li>Electrochemical heat source term</li>
<li>Darcy-Forchheimer axial pressure drop (viscous plus inertial loss)</li>
<li>Convective heat exchange with PEN and interconnect</li>
</ul>
</html>"));
end AirChannel;
