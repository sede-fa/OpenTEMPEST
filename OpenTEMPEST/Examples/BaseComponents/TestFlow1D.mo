within OpenTEMPEST.Examples.BaseComponents;
model TestFlow1D "1D gas flow heated by a wall that steps in temperature"
  extends Modelica.Icons.Example;
  inner OpenTEMPEST.System system;
  OpenTEMPEST.Flow.Flow1D flow1D(
    redeclare package Medium = OpenTEMPEST.Medium.Air_Medium,
    N=6,
    L=2,
    Ntubes=2,
    TStartIn=600,
    TStartOut=600) annotation (Placement(transformation(extent={{-20,-10},{20,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T source(
    redeclare package Medium = OpenTEMPEST.Medium.Air_Medium,
    nPorts=1,
    m_flow=0.02,
    T=600) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Fluid.Sources.Boundary_pT sink(
    redeclare package Medium = OpenTEMPEST.Medium.Air_Medium,
    nPorts=1,
    p=101325) annotation (Placement(transformation(extent={{70,-10},{50,10}})));
  OpenTEMPEST.Heat.TempSource1DFV wall(N=6) annotation (Placement(transformation(extent={{-20,30},{20,50}})));
  Modelica.Blocks.Sources.Step step(height=100, offset=500, startTime=1)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
equation
  connect(source.ports[1], flow1D.infl) annotation (Line(points={{-50,0},{-20,0}}, color={0,127,255}));
  connect(flow1D.outfl, sink.ports[1]) annotation (Line(points={{20,0},{50,0}}, color={0,127,255}));
  connect(wall.wall, flow1D.wall) annotation (Line(points={{0,36},{0,5}}, color={255,127,0}));
  connect(step.y, wall.temperature) annotation (Line(points={{-39,50},{-10,50},{-10,48}}, color={0,0,127}));
  annotation (experiment(StopTime=5), Documentation(info="<html>
<p>Air flows through <a href=\"modelica://OpenTEMPEST.Flow.Flow1D\">Flow1D</a> while the wall temperature steps from 500 K to 600 K.
Try <code>redeclare function fluxInterp = OpenTEMPEST.Flow.FluxInterpolators.LUDSinterp</code>, <code>useForchheimer = true</code>
or <code>redeclare model HeatTransferModel = OpenTEMPEST.Flow.HeatTransfer.ConstantNusselt</code> on <code>flow1D</code>.</p>
</html>"));
end TestFlow1D;
