within OpenTEMPEST.Examples.BaseComponents;
model TestWall1D "Metal wall heated on one side and cooled on the other"
  extends Modelica.Icons.Example;

  inner OpenTEMPEST.System system annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
  OpenTEMPEST.Heat.Wall1D wall(
    N=5,
    lX=1,
    lY=0.1,
    lZ=0.005,
    rhoCustom=7800,
    cpCustom=500,
    kCustom_trans=20,
    Tstartbar=300,
    initOpt=OpenTEMPEST.Enumerations.InitOptions.fixedState)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature hotSide[5] annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature coldSide[5](each T=300)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  OpenTEMPEST.Heat.HTs_DHT hotAdapter(N=5) annotation (Placement(transformation(extent={{-30,16},{-10,36}})));
  OpenTEMPEST.Heat.HTs_DHT coldAdapter(N=5) annotation (Placement(transformation(extent={{-30,-36},{-10,-16}})));
  Modelica.Blocks.Sources.Step step(
    height=500,
    offset=300,
    startTime=10) annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
equation
  for i in 1:5 loop
    connect(step.y, hotSide[i].T);
  end for;
  connect(hotSide.port, hotAdapter.HT_ports);
  connect(coldSide.port, coldAdapter.HT_ports);
  connect(hotAdapter.DHT_port, wall.dhT_int);
  connect(coldAdapter.DHT_port, wall.dhT_ext);
  annotation (
    experiment(StopTime=100),
    Documentation(info="<html>
<p>A 5 mm steel wall divided into 5 control volumes. The inner side steps from 300 K to 800 K at t = 10 s while the outer
side is held at 300 K. Each control volume heats up towards the mean of the two surface temperatures (550 K); the heat conducted through the
wall is <code>wall.dhT_ext.Q</code>. Look at <code>wall.T</code>.</p>
</html>"));
end TestWall1D;
