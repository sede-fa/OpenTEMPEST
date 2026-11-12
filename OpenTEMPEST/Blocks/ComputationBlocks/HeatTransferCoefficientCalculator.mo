within OpenTEMPEST.Blocks.ComputationBlocks;
model HeatTransferCoefficientCalculator
  "Laminar flat-plate Nusselt number and heat transfer coefficient from the gas properties at a given state"

  import SI = Modelica.SIunits;

  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    annotation (choicesAllMatching=true);
  parameter Medium.AbsolutePressure p=101325 "Pressure";
  parameter Medium.Temperature T=300 "Temperature";
  parameter Medium.MassFraction X[Medium.nX]=Medium.reference_X "Gas composition";
  parameter Medium.MassFlowRate mf=0 "Mass flowrate";

  parameter SI.Distance L "Flow channel length";
  parameter SI.Length H "height of flow channel between two parallel plates";
  parameter SI.Length W "width of flow channel between two parallel plates";
  parameter SI.Length D "diameter of flow channel in a pipe";

  parameter Boolean pipe=false
    "= true if flow through a pipe, false if between two parallel plates";

  Real Nu;
  Real alpha;

protected
  parameter SI.Area A=if pipe then Modelica.Constants.pi*D^2/4 else W*H "Flow cross section";
  parameter SI.Length Dhyd=if pipe then D else H "Hydraulic diameter";
  Medium.ThermodynamicState state=Medium.setState_pTX(p, T, X) "Gas state";
  Medium.DynamicViscosity mu=Medium.dynamicViscosity(state);
  Medium.ThermalConductivity k=Medium.thermalConductivity(state);
  Medium.SpecificHeatCapacity cp=Medium.heatCapacity_cp(state);
  Real Re=abs(mf*Dhyd/(A*mu)) "Reynolds number";
  Real Pr=cp*mu/k "Prandtl number";

equation
  // Flat plate - laminar boundary layer, isothermal surface
  Nu = 0.664*Re^0.5*Pr^(1/3);
  // NOTE: kept as in the previous ThermoPower-based version, which multiplied by the dynamic viscosity.
  // The dimensionally consistent form would use the thermal conductivity k instead of mu.
  alpha = Nu*mu/Dhyd;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end HeatTransferCoefficientCalculator;
