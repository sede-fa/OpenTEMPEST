within OpenTEMPEST.Examples.BOP;
model TestCompressor "Compressor with a stepped pressure ratio"
  extends Modelica.Icons.Example;
  package Medium = OpenTEMPEST.Medium.Air_Medium;

  inner OpenTEMPEST.System system(allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
  Modelica.Fluid.Sources.Boundary_pT inletBoundary(
    redeclare package Medium = Medium,
    p=1e5,
    T=300,
    nPorts=1) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  OpenTEMPEST.BOP.Compressor compressor(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenTEMPEST.Flow.SinkPressure sink(redeclare package Medium = Medium, p0=1e5, R=5e5)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  OpenTEMPEST.Electrical.Grid grid(Pgrid=1e9) annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature ambient(T=300)
    annotation (Placement(transformation(extent={{60,50},{40,70}})));
  Modelica.Blocks.Sources.Step pressureRatio(
    height=1,
    offset=1.5,
    startTime=5) annotation (Placement(transformation(extent={{-50,-50},{-30,-30}})));
equation
  connect(inletBoundary.ports[1], compressor.inlet) annotation (Line(points={{-60,0},{-10,0}}, color={28,108,200}));
  connect(compressor.outlet, sink.flange) annotation (Line(points={{10,0},{60,0}}, color={28,108,200}));
  connect(compressor.powerConnection, grid.port) annotation (Line(points={{-5,10},{-5,50},{-20,60}}, color={0,0,255}));
  connect(compressor.heatLosses, ambient.port) annotation (Line(points={{5,10},{5,60},{40,60}}, color={191,0,0}));
  connect(pressureRatio.y, compressor.Pi) annotation (Line(points={{-29,-40},{0,-40},{0,-8}}, color={0,0,127}));
  annotation (
    experiment(StopTime=10),
    Documentation(info="<html>
<p>Air is compressed from 1 bar with a pressure ratio that steps from 1.5 to 2.5. The outlet is a pressure sink
with a linear resistance, so the flow follows from the pressure ratio (0.1 kg/s at 1.5, 0.3 kg/s at 2.5). Look at the outlet temperature, <code>compressor.load.P</code> and the heat
loss to the ambient.</p>
</html>"));
end TestCompressor;
