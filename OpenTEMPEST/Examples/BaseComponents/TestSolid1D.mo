within OpenTEMPEST.Examples.BaseComponents;
model TestSolid1D "Steel plate with axial conduction, heated at one end"
  extends Modelica.Icons.Example;

  inner OpenTEMPEST.System system annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
  OpenTEMPEST.Heat.Solid1D plate(
    redeclare package SolidMat = OpenTEMPEST.Solid.Material.Steel,
    N=10,
    lX=0.5,
    lY=0.1,
    lZ=0.005,
    Tstartbar=300) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature hotEnd annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature coldEnd(T=300) annotation (Placement(transformation(extent={{70,-10},{50,10}})));
  Modelica.Blocks.Sources.Step step(
    height=500,
    offset=300,
    startTime=10) annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
equation
  connect(step.y, hotEnd.T) annotation (Line(points={{-79,0},{-72,0}}, color={0,0,127}));
  connect(hotEnd.port, plate.hT_x0) annotation (Line(points={{-50,0},{-10,0}}, color={191,0,0}));
  connect(plate.hT_xN, coldEnd.port) annotation (Line(points={{10,0},{50,0}}, color={191,0,0}));
  annotation (
    experiment(StopTime=2000),
    Documentation(info="<html>
<p>Heat conduction along a 0.5 m long steel plate (<code>Solid.Material.Steel</code>, temperature dependent properties).
The left end steps to 800 K at t = 10 s and the right end is held at 300 K. The unused side ports of <code>Solid1D</code>
(<code>dhT_z0</code>, <code>dhT_z1</code>, <code>dhT_y0</code>, <code>dhT_y1</code>) are left unconnected, which means they are
adiabatic. Look at <code>plate.T</code> for the developing temperature profile.</p>
</html>"));
end TestSolid1D;
