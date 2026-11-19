within OpenTEMPEST.Examples.BOP;
model TestElectricHeater0D "Electric gas heater with temperature control following a set point step"
  extends Modelica.Icons.Example;
  package Medium = OpenTEMPEST.Medium.Fuel_CH4;

  inner OpenTEMPEST.System system(allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
  OpenTEMPEST.Flow.SourceMassFlow source(
    redeclare package Medium = Medium,
    w0=2e-4,
    T=300,
    p0=1.2e5) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  OpenTEMPEST.BOP.GasConditioning.ElectricHeater0D heater(
    redeclare package Medium = Medium,
    PMax=5000,
    TStart=300) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenTEMPEST.Flow.SinkPressure sink(redeclare package Medium = Medium, p0=1e5, T=300)
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  OpenTEMPEST.Electrical.Grid grid(Pgrid=1e9) annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  Modelica.Blocks.Sources.Step setPoint(
    height=200,
    offset=500,
    startTime=100) annotation (Placement(transformation(extent={{-50,30},{-30,50}})));
equation
  connect(source.flange, heater.fl_inlet) annotation (Line(points={{-50,0},{-10,0}}, color={28,108,200}));
  connect(heater.fl_outlet, sink.flange) annotation (Line(points={{10,0},{50,0}}, color={28,108,200}));
  connect(heater.powerConnection, grid.port) annotation (Line(points={{0,6},{0,40}}, color={0,0,255}));
  connect(setPoint.y, heater.in_TSet) annotation (Line(points={{-29,40},{-5,40},{-5,5}}, color={0,0,127}));
  annotation (
    experiment(StopTime=1500),
    Documentation(info="<html>
<p>Methane flows through an electric heater with a PI temperature controller and a power limit of 5 kW. The set point
steps from 500 K to 700 K at t = 100 s. Look at <code>heater.out_TAct</code> and the electric power
<code>heater.load.P</code>; the power saturates at 5 kW while the element heats up, the temperature overshoots by about 35 K and settles at the set point after roughly 1000 s.</p>
</html>"));
end TestElectricHeater0D;
