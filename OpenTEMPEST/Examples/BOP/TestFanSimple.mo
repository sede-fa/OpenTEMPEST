within OpenTEMPEST.Examples.BOP;
model TestFanSimple "Fan with prescribed mass flow between two pressure boundaries"
  extends Modelica.Icons.Example;
  package Medium = OpenTEMPEST.Medium.Air_Medium;

  inner OpenTEMPEST.System system(allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
  Modelica.Fluid.Sources.Boundary_pT inletBoundary(
    redeclare package Medium = Medium,
    p=1e5,
    T=300,
    nPorts=1) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  OpenTEMPEST.BOP.FanSimple fan(redeclare package Medium = Medium, eta=0.7, hStart=3e5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_pT outletBoundary(
    redeclare package Medium = Medium,
    p=1.05e5,
    T=300,
    nPorts=1) annotation (Placement(transformation(extent={{80,-10},{60,10}})));
  OpenTEMPEST.Electrical.Grid grid(Pgrid=1e9) annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Modelica.Blocks.Sources.Ramp massFlow(
    height=0.05,
    duration=10,
    offset=0.05,
    startTime=1) annotation (Placement(transformation(extent={{-50,30},{-30,50}})));
equation
  connect(inletBoundary.ports[1], fan.fl_inlet) annotation (Line(points={{-60,0},{-10,0}}, color={28,108,200}));
  connect(fan.fl_outlet, outletBoundary.ports[1]) annotation (Line(points={{10,0},{60,0}}, color={28,108,200}));
  connect(massFlow.y, fan.in_mf) annotation (Line(points={{-29,40},{-4,40},{-4,8}}, color={0,0,127}));
  connect(fan.powerConnection, grid.port) annotation (Line(points={{0,10},{0,50}}, color={0,0,255}));
  annotation (
    experiment(StopTime=20),
    Documentation(info="<html>
<p>A fan lifts air from 1.00 bar to 1.05 bar. The mass flow is ramped from 0.05 to 0.1 kg/s.
Look at <code>fan.P</code> (electric power), <code>fan.hOut - fan.hIn</code> (temperature rise through the fan)
and the grid frequency <code>grid.f</code>.</p>
</html>"));
end TestFanSimple;
