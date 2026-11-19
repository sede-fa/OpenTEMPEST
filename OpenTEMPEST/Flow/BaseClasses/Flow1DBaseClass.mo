within OpenTEMPEST.Flow.BaseClasses;
partial model Flow1DBaseClass "Base class for 1D finite volume flow models, used for plug flow and catalytic reactors"

  import SI = Modelica.Units.SI;
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    annotation(choicesAllMatching = true);
  parameter Integer N(min=3) = 5;
  parameter Integer Ntubes = 1 "number of individual tubes";

  // Pressure drop
  parameter Real dpdxNom = 100 "Pressure drop per length for the constant pressure gradient option (Pa/m)"
    annotation (Dialog(tab="Pressure drop", enable=not useForchheimer));
  parameter Boolean useForchheimer = false "= true: Darcy-Forchheimer pressure drop (flow dependent) instead of the constant gradient dpdxNom"
    annotation (Evaluate=true, Dialog(tab="Pressure drop"), choices(checkBox=true));
  parameter SI.Area kPerm = 3e-9 "Permeability of the porous medium in the channel (Darcy-Forchheimer option)"
    annotation (Dialog(tab="Pressure drop", enable=useForchheimer));
  parameter Real betaForch(unit="1/m") = 0 "Forchheimer (inertial resistance) coefficient, 0 gives Darcy's law"
    annotation (Dialog(tab="Pressure drop", enable=useForchheimer));
  final parameter SI.Length lFace[N+1] =
      cat(1, {theta[1,1]*dx/2}, {(theta[i,1] + theta[i+1,1])*dx/2 for i in 1:N-1}, {theta[N,1]*dx/2})
    "Flow length assigned to each face for the pressure drop (face 1 at the inlet, face N+1 at the outlet)";

  // Initial Values
  parameter SI.Temperature TStartIn=773.15   annotation (Dialog(tab="Initialisation"));
  parameter SI.Temperature TStartOut=773.15   annotation (Dialog(tab="Initialisation"));
  parameter SI.Temperature TStart[N] = linspace(TStartIn, TStartOut, N) annotation (Dialog(tab="Initialisation"));
  parameter SI.AbsolutePressure pStart=101325   annotation (Dialog(tab="Initialisation"));
  parameter SI.MassFraction xStart[nSpecies] = Medium.reference_X annotation (Dialog(tab="Initialisation"));

  // Dimensions
  parameter SI.Length Rh = 2.5e-2 "Hydraulic Radius single channel (Dh/2) /m" annotation (Dialog(tab="Dimensions"));
  parameter SI.Length omega = 2*Modelica.Constants.pi*Rh "Wetted Perimeter single channel /m" annotation (Dialog(tab="Dimensions"));
  parameter Real theta0_1 = 1 "Proportion of entrance and exit volumes to centre volumes /-" annotation (Dialog(tab="Dimensions"));
  parameter SI.Length L = 1 "Length of pipe /m" annotation (Dialog(tab="Dimensions"));

  parameter SI.Area Acs = Rh*omega/2 "channel cross sectional area" annotation (Dialog(tab="Dimensions"));
  parameter SI.Area Aw = omega*dx "HT area for one CV single channel" annotation (Dialog(tab="Dimensions"));
  parameter Real theta[N,1] = [theta0_1; fill(1, N-2); theta0_1] "coefficient for CV size" annotation (Dialog(tab="Dimensions"));

  parameter SI.Volume dV = Acs*dx "Size of nominal control volume /m3" annotation (Dialog(tab="Dimensions"));
  parameter SI.Length dx = L/(N - 2 + 2*theta0_1) "length of nominal 1D control volume /m" annotation (Dialog(tab="Dimensions"));

  Medium.BaseProperties Gas[N](
    p(each start=pStart, each stateSelect=StateSelect.prefer),
    T(start=TStart[1:N], each stateSelect=StateSelect.prefer),
    Xi(each stateSelect=StateSelect.prefer))
    "Gas volume properties";

  // Centre cell values
  SI.MassFlowRate mf[N] "Mass flow rate leaving CV";
  SI.MassFlowRate mfv[N+1] "Mass flow rate at the CV faces, mfv[1] enters the first CV";

  OpenTEMPEST.Interfaces.GasFlangeA infl(redeclare package Medium = Medium)
      annotation (Placement(transformation(extent={{-100,-8},{-80,12}}),
        iconTransformation(extent={{-108,-16},{-80,12}})));
  OpenTEMPEST.Interfaces.GasFlangeB outfl(redeclare package Medium = Medium)
      annotation (Placement(transformation(extent={{80,-10},{100,10}}),
        iconTransformation(extent={{80,-14},{108,14}})));

  SI.PressureDifference dp[N+1] "Pressure drop across each face (inlet to CV 1, between CVs, CV N to outlet)";

protected
  constant Integer nSpecies = Medium.nXi;

equation
  // Momentum balance: pressure drop across each face, using the properties of the CV downstream of
  // the face (CV N for the outlet face)
  if useForchheimer then
    for i in 1:N+1 loop
      dp[i] = OpenTEMPEST.Blocks.Functions.pressureDropForchheimer(
        mfv[i]/Ntubes, Medium.dynamicViscosity(Gas[min(i, N)].state), Gas[min(i, N)].d, lFace[i], Acs, kPerm, betaForch);
    end for;
  else
    dp = dpdxNom*lFace;
  end if;
  infl.p - Gas[1].p = dp[1];
  Gas[1:N-1].p - Gas[2:N].p = dp[2:N];
  Gas[N].p - outfl.p = dp[N+1];

initial equation
  //Gas[:].T = TStart[:];
  Gas[:].Xi = fill(xStart, N);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-80,34},{80,-32}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.HorizontalCylinder)}),         Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Flow1DBaseClass;
