within OpenTEMPEST.Examples.BaseComponents;
model TestGridLoad "Electrical load on a grid with droop"
  extends Modelica.Icons.Example;

  inner OpenTEMPEST.System system annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
  OpenTEMPEST.Electrical.Grid grid(Pgrid=1e5, droop=0.05) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  OpenTEMPEST.Electrical.Load load(Pnom=1e4, usePowerInput=true) annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Sources.Step loadStep(
    height=5e4,
    offset=1e4,
    startTime=5) annotation (Placement(transformation(extent={{0,30},{20,50}})));
equation
  connect(grid.port, load.port) annotation (Line(points={{-40,0},{40,0}}, color={0,0,255}));
  connect(loadStep.y, load.referencePower) annotation (Line(points={{21,40},{46,40},{46,10}}, color={0,0,127}));
  annotation (
    experiment(StopTime=10),
    Documentation(info="<html>
<p>A grid with a rated power of 100 kW and 5 % droop supplies a load that steps from 10 kW to 60 kW. The grid frequency
<code>grid.f</code> falls proportionally to the additional power drawn, and the load power follows the frequency through
its power curve (flat by default).</p>
</html>"));
end TestGridLoad;
