within OpenTEMPEST.BOP;
model Evaporator
  "Drum evaporator producing steam for a gas phase medium (under construction)"
  extends Modelica.Icons.UnderConstruction; // check media

  replaceable package gasPhaseMedium =
      Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
  package WaterMedium = Modelica.Media.Water.StandardWater "Water/steam medium";

  parameter Modelica.Units.SI.Volume Vd "Drum internal volume";
  parameter Modelica.Units.SI.Mass Mm "Drum metal mass";
  parameter Modelica.Units.SI.SpecificHeatCapacity cm "Specific heat capacity of the drum's metal";

  parameter OpenTEMPEST.Units.HydraulicConductance Kv "Nominal hydraulic conductance of the control valve";

  parameter Modelica.Units.SI.Pressure pStart "Pressure start value"
    annotation (Dialog(tab="Initialisation"));
  parameter Modelica.Units.SI.Volume VlStart "Start value of drum water volume"
    annotation (Dialog(tab="Initialisation"));

  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler drumEquilibrium(
    redeclare package Medium = WaterMedium,
    m_D=Mm,
    cp_D=cm,
    V_t=Vd,
    p_start=pStart,
    V_l_start=VlStart)
    annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a inlet(redeclare package Medium = WaterMedium)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Modelica.Fluid.Sources.Boundary_pT sinkPressure(
    redeclare package Medium = WaterMedium,
    use_p_in=true,
    nPorts=1) annotation (Placement(transformation(extent={{30,-10},{10,10}})));
  OpenTEMPEST.Flow.SourceMassFlow sourceMassFlow(
    redeclare package Medium = gasPhaseMedium,
    Xnom={1e-5,1e-5,1e-5,1e-5,1,1e-5},
    use_in_w0=true,
    use_in_T=true) annotation (Placement(transformation(extent={{38,10},{58,-10}})));
  OpenTEMPEST.Interfaces.GasFlangeB outlet(redeclare package Medium = gasPhaseMedium)
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  OpenTEMPEST.Flow.SensP sensP(redeclare package Medium = gasPhaseMedium)
    annotation (Placement(transformation(extent={{80,-6},{60,14}})));
  Modelica.Fluid.Valves.ValveLinear valveLin(
    redeclare package Medium = WaterMedium,
    dp_nominal=100000,
    m_flow_nominal=Kv*100000) annotation (Placement(transformation(extent={{-54,-10},{-34,10}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort sensT(redeclare package Medium = WaterMedium)
    annotation (Placement(transformation(extent={{-12,6},{8,-14}})));
  Modelica.Fluid.Sensors.MassFlowRate sensW(redeclare package Medium = WaterMedium)
    annotation (Placement(transformation(extent={{-32,6},{-12,-14}})));
  OpenTEMPEST.Interfaces.HT hT
    annotation (Placement(transformation(extent={{-12,80},{8,100}}),
        iconTransformation(extent={{-10,40},{10,60}})));
  Modelica.Blocks.Interfaces.RealInput controlValvePosition
    annotation (Placement(transformation(extent={{20,20},{60,60}}),
        iconTransformation(extent={{40,40},{60,60}})));
equation
  connect(drumEquilibrium.port_a, inlet);
  connect(sourceMassFlow.flange, outlet);
  connect(sourceMassFlow.flange, sensP.flange);
  connect(sensP.p, sinkPressure.p_in);
  connect(valveLin.port_a, drumEquilibrium.port_b);
  connect(sensT.port_b, sinkPressure.ports[1]);
  connect(sensT.T, sourceMassFlow.in_T);
  connect(valveLin.port_b, sensW.port_a);
  connect(sensW.port_b, sensT.port_a);
  connect(sensW.m_flow, sourceMassFlow.in_w0);
  connect(hT, drumEquilibrium.heatPort);
  connect(valveLin.opening, controlValvePosition);
  annotation (                                                             Icon(
        graphics={Rectangle(
          extent={{-80,40},{80,-40}},
          lineColor={28,108,200},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid)}));
end Evaporator;
