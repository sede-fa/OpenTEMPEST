within OpenTEMPEST.Examples.BOP;
model TestSimpleGasHeaterVol "Gas volume heated through a lumped heat port"
  extends Modelica.Icons.Example;
  package Medium = OpenTEMPEST.Medium.Air_Medium;

  inner OpenTEMPEST.System system(allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
  OpenTEMPEST.Flow.SourceMassFlow source(
    redeclare package Medium = Medium,
    w0=1e-3,
    T=300,
    p0=1.2e5) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  OpenTEMPEST.BOP.GasConditioning.SimpleGasHeaterVol heater(
    redeclare package medium = Medium,
    TStart=300,
    pStart=1.1e5,
    includePressureLoss=true,
    R=1e3) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenTEMPEST.Flow.SinkPressure sink(redeclare package Medium = Medium, p0=1e5, T=300)
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature wall
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  Modelica.Blocks.Sources.Step wallTemperature(
    height=300,
    offset=300,
    startTime=10) annotation (Placement(transformation(extent={{-50,40},{-30,60}})));
equation
  connect(source.flange, heater.inlet) annotation (Line(points={{-50,0},{-10,0}}, color={28,108,200}));
  connect(heater.outlet, sink.flange) annotation (Line(points={{10,0},{50,0}}, color={28,108,200}));
  connect(wallTemperature.y, wall.T) annotation (Line(points={{-29,50},{-12,50}}, color={0,0,127}));
  connect(wall.port, heater.ht) annotation (Line(points={{10,50},{10,6},{0,6}}, color={191,0,0}));
  annotation (
    experiment(StopTime=100),
    Documentation(info="<html>
<p>Air flows through a gas volume whose wall temperature steps from 300 K to 600 K at t = 10 s. The heat transfer
coefficient follows from the flow (laminar, parallel plates). Look at the gas temperature
<code>heater.plenum.medium.T</code> and the heat flow <code>wall.port.Q_flow</code>.</p>
</html>"));
end TestSimpleGasHeaterVol;
