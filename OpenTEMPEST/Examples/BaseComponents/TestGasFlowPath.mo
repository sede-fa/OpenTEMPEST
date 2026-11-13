within OpenTEMPEST.Examples.BaseComponents;
model TestGasFlowPath "Mass flow source, linear pressure drop and pressure sink"
  extends Modelica.Icons.Example;
  package Medium = OpenTEMPEST.Medium.Air_Medium;

  inner OpenTEMPEST.System system(allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
  OpenTEMPEST.Flow.SourceMassFlow source(
    redeclare package Medium = Medium,
    use_in_w0=true,
    p0=1.2e5,
    T=973.15) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  OpenTEMPEST.Flow.PressDropLin pressDrop(redeclare package Medium = Medium, R=1e6)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenTEMPEST.Flow.SinkPressure sink(
    redeclare package Medium = Medium,
    p0=1.01325e5,
    T=973.15) annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Blocks.Sources.Ramp massFlow(
    height=0.01,
    duration=10,
    offset=0.001,
    startTime=1) annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
equation
  connect(massFlow.y, source.in_w0) annotation (Line(points={{-79,30},{-66,30},{-66,5}}, color={0,0,127}));
  connect(source.flange, pressDrop.inlet) annotation (Line(points={{-50,0},{-10,0}}, color={28,108,200}));
  connect(pressDrop.outlet, sink.flange) annotation (Line(points={{10,0},{50,0}}, color={28,108,200}));
  annotation (
    experiment(StopTime=20),
    Documentation(info="<html>
<p>Checks the new gas flanges, <code>SourceMassFlow</code>, <code>PressDropLin</code> and
<code>SinkPressure</code>. Expected: <code>pressDrop.dp = 1e6*massFlow.y</code> and the sink receives
gas at 973.15 K with the reference air composition.</p>
</html>"));
end TestGasFlowPath;
