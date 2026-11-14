within OpenTEMPEST.Examples.BOP;
model TestVaporizer "Electrically heated vaporizer turning liquid water into steam"
  extends Modelica.Icons.Example;

  inner OpenTEMPEST.System system(allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
  Modelica.Fluid.Sources.MassFlowSource_T water(
    redeclare package Medium = Modelica.Media.Water.StandardWater,
    m_flow=0.008,
    T=293.15,
    nPorts=1) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  OpenTEMPEST.BOP.Vaporizer vaporizer(mfNom=0.008) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenTEMPEST.Flow.SinkPressure steamSink(
    redeclare package Medium = OpenTEMPEST.Medium.Fuel_CH4,
    p0=101325,
    T=400) annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  OpenTEMPEST.Electrical.Grid grid(Pgrid=1e9) annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
equation
  connect(water.ports[1], vaporizer.waterInlet) annotation (Line(points={{-50,0},{-10,0}}, color={28,108,200}));
  connect(vaporizer.gasOutlet1, steamSink.flange) annotation (Line(points={{10,5},{30,5},{30,0},{50,0}}, color={28,108,200}));
  connect(vaporizer.port, grid.port) annotation (Line(points={{5,-10},{5,-30}}, color={0,0,255}));
  annotation (
    experiment(StopTime=600),
    Documentation(info="<html>
<p>Liquid water at 20 &deg;C and 8 g/s enters the vaporizer, which regulates its electric power to deliver steam.
Look at the steam outlet temperature, the electric power drawn from the grid (<code>vaporizer.load.P</code>) and the
wall temperatures in <code>vaporizer.metalWallFV.T</code>.</p>
</html>"));
end TestVaporizer;
