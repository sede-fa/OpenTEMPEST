within OpenTEMPEST.Examples.BOP;
model TestEvaporator "Drum evaporator with a heated wall and a steam control valve"
  extends Modelica.Icons.Example;

  inner OpenTEMPEST.System system(allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
  Modelica.Fluid.Sources.MassFlowSource_T water(
    redeclare package Medium = Modelica.Media.Water.StandardWater,
    m_flow=0.01,
    T=293.15,
    nPorts=1) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  OpenTEMPEST.BOP.Evaporator evaporator(
    redeclare package gasPhaseMedium = OpenTEMPEST.Medium.Fuel_CH4,
    Vd=0.05,
    Mm=20,
    cm=500,
    Kv=1e-6,
    pStart=1e5,
    VlStart=0.02) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenTEMPEST.Flow.SinkPressure sink(
    redeclare package Medium = OpenTEMPEST.Medium.Fuel_CH4,
    p0=101325,
    T=400) annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow wall
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  Modelica.Blocks.Sources.Constant heat(k=26000) annotation (Placement(transformation(extent={{-50,60},{-30,80}})));
  Modelica.Blocks.Sources.Constant valvePosition(k=1) annotation (Placement(transformation(extent={{-50,30},{-30,50}})));
equation
  connect(water.ports[1], evaporator.inlet) annotation (Line(points={{-50,0},{-10,0}}, color={28,108,200}));
  connect(evaporator.outlet, sink.flange) annotation (Line(points={{10,0},{50,0}}, color={28,108,200}));
  connect(wall.port, evaporator.hT) annotation (Line(points={{10,50},{0,50},{0,5}}, color={191,0,0}));
  connect(heat.y, wall.Q_flow) annotation (Line(points={{-29,70},{-20,70},{-20,50},{-10,50}}, color={0,0,127}));
  connect(valvePosition.y, evaporator.controlValvePosition) annotation (Line(points={{-29,40},{5,40},{5,5}}, color={0,0,127}));
  annotation (
    experiment(StopTime=500),
    Documentation(info="<html>
<p>Water at 10 g/s fills a drum that is heated with 26 kW (about what the feed needs to become steam). The steam leaves through a control valve and is converted to a
gas stream. The model is marked under construction because the steam is mapped onto the gas medium without
accounting for its composition. The drum pressure settles at about 1.1 bar and the steam mass flow equals the feed. Look at <code>evaporator.drumEquilibrium.p</code> and <code>evaporator.sensW.m_flow</code>.</p>
</html>"));
end TestEvaporator;
