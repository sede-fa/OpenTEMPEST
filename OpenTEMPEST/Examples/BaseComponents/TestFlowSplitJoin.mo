within OpenTEMPEST.Examples.BaseComponents;
model TestFlowSplitJoin "Gas flow split into two branches with different resistance and joined again"
  extends Modelica.Icons.Example;
  package Medium = OpenTEMPEST.Medium.Air_Medium;

  inner OpenTEMPEST.System system(allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
  OpenTEMPEST.Flow.SourceMassFlow source(
    redeclare package Medium = Medium,
    use_in_w0=true,
    p0=1.2e5,
    T=500) annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  OpenTEMPEST.Flow.FlowSplit split(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  OpenTEMPEST.Flow.PressDropLin branch1(redeclare package Medium = Medium, R=1e5)
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  OpenTEMPEST.Flow.PressDropLin branch2(redeclare package Medium = Medium, R=3e5)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  OpenTEMPEST.Flow.FlowJoin join(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  OpenTEMPEST.Flow.SinkPressure sink(redeclare package Medium = Medium, p0=1e5, T=300)
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  OpenTEMPEST.Flow.SensW sensW1(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-30,22},{-18,34}})));
  Modelica.Blocks.Sources.Ramp massFlow(
    height=0.02,
    duration=10,
    offset=0.01,
    startTime=1) annotation (Placement(transformation(extent={{-100,30},{-80,50}})));
equation
  connect(massFlow.y, source.in_w0) annotation (Line(points={{-79,40},{-86,40},{-86,5}}, color={0,0,127}));
  connect(source.flange, split.inlet) annotation (Line(points={{-70,0},{-50,0}}, color={28,108,200}));
  connect(split.outlet1, sensW1.inlet) annotation (Line(points={{-30,4},{-30,28}}, color={28,108,200}));
  connect(sensW1.outlet, branch1.inlet) annotation (Line(points={{-18,28},{-10,28},{-10,30}}, color={28,108,200}));
  connect(split.outlet2, branch2.inlet) annotation (Line(points={{-30,-4},{-20,-4},{-20,-30},{-10,-30}}, color={28,108,200}));
  connect(branch1.outlet, join.inlet1) annotation (Line(points={{10,30},{30,30},{30,4}}, color={28,108,200}));
  connect(branch2.outlet, join.inlet2) annotation (Line(points={{10,-30},{30,-30},{30,-4}}, color={28,108,200}));
  connect(join.outlet, sink.flange) annotation (Line(points={{50,0},{70,0}}, color={28,108,200}));
  annotation (
    experiment(StopTime=20),
    Documentation(info="<html>
<p>The flow is split into two branches with linear pressure drops of 1e5 and 3e5 Pa/(kg/s) and joined again. Both branches
see the same pressure difference, so the flow divides 3:1 (<code>branch1.inlet.m_flow</code> versus
<code>branch2.inlet.m_flow</code>).</p>
</html>"));
end TestFlowSplitJoin;
