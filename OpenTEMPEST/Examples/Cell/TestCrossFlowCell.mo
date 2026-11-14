within OpenTEMPEST.Examples.Cell;
model TestCrossFlowCell "2D cross-flow cell in steam electrolysis, adiabatic, with the inlet manifolds of the cell"
  extends Modelica.Icons.Example;

  import SI = Modelica.Units.SI;

  parameter SI.Pressure pStart=100000;
  parameter SI.Temperature TStart(displayUnit="K")=1023.15;

  OpenTEMPEST.SOC.Cell.CrossFlow.Cell cell(
    nX=4,
    nY=4,
    TStart=TStart,
    pStart=pStart) annotation (Placement(transformation(extent={{-30,-30},{30,30}})));
  OpenTEMPEST.BOP.PowerElectronics powerElectronics(nChannels=1)
    annotation (Placement(transformation(extent={{-110,-12},{-84,12}})));
  OpenTEMPEST.Flow.SourceMassFlowEC fuelSource(
    p0=1.1*sinkFuel.p0,
    T(displayUnit="K") = TStart,
    compositionNom={0.01228,0.00001,0.00001,0.00001,0.98772,0.00001},
    RC0=0.75,
    nCells=1,
    minCurrentForDosing=12.78,
    use_in_I=true) annotation (Placement(transformation(extent={{-112,32},{-92,52}})));
  OpenTEMPEST.Flow.SourceMassFlow airSource(
    redeclare package Medium = OpenTEMPEST.Medium.Air_Medium,
    w0=4.29048E-04,
    p0=1.1*sinkAir.p0,
    T(displayUnit="K") = TStart) annotation (Placement(transformation(extent={{-112,-64},{-92,-44}})));
  OpenTEMPEST.Flow.SinkPressure sinkAir(
    redeclare package Medium = OpenTEMPEST.Medium.Air_Medium,
    p0=pStart) annotation (Placement(transformation(extent={{88,-58},{108,-38}})));
  OpenTEMPEST.Flow.SinkPressure sinkFuel(redeclare package Medium = OpenTEMPEST.Medium.Fuel_CH4, p0=pStart)
    annotation (Placement(transformation(extent={{88,32},{108,52}})));
  OpenTEMPEST.Electrical.Grid grid(Pgrid=55555555555) annotation (Placement(transformation(extent={{-82,-36},{-62,-16}})));
  OpenTEMPEST.Blocks.Sources.MultiRamp currentRamp(
    n=1,
    height=fill(-20, currentRamp.n),
    duration=fill(100, currentRamp.n),
    startTime={200}) annotation (Placement(transformation(extent={{-150,-8},{-130,12}})));
  inner OpenTEMPEST.System system annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
equation
  connect(fuelSource.flange, cell.fuelIn) annotation (Line(points={{-92,42},{-60,42},{-60,22},{-31,22}}, color={28,108,200}));
  connect(airSource.flange, cell.airIn) annotation (Line(points={{-92,-54},{-40,-54},{-40,-27},{-31,-27}}, color={28,108,200}));
  connect(cell.fuelOut, sinkFuel.flange) annotation (Line(points={{30,18},{60,18},{60,42},{88,42}}, color={28,108,200}));
  connect(cell.airout, sinkAir.flange) annotation (Line(points={{30,-18},{60,-18},{60,-48},{88,-48}}, color={28,108,200}));
  connect(powerElectronics.gridConnectionAC, grid.port)
    annotation (Line(points={{-85.3,-3.6},{-80,-3.6},{-80,-26}}, color={0,0,255}, thickness=0.5));
  connect(powerElectronics.pinN[1], cell.pin_p) annotation (Line(points={{-93.1,-10.8},{-93.1,-20},{-40,-20},{-40,10},{-30,10}}, color={0,0,255}));
  connect(powerElectronics.pinP[1], cell.pin_n) annotation (Line(points={{-100.9,-10.8},{-100.9,-16},{-44,-16},{-44,18},{-30,18}}, color={0,0,255}));
  connect(currentRamp.y, powerElectronics.currentInput[1]) annotation (Line(points={{-129,2},{-100.9,2},{-100.9,10.8}}, color={0,0,127}));
  connect(currentRamp.y, fuelSource.in_I) annotation (Line(points={{-129,2},{-120,2},{-120,47},{-108,47}}, color={0,0,127}));
  annotation (
    experiment(StopTime=600),
    Documentation(info="<html>
<p>A single 2D cross-flow cell (4x4 control volumes) in steam electrolysis. The fuel and the air enter through one flange
each; the manifolds inside the cell (<code>manifold</code>, <code>manifold1</code>) distribute the flow over the
first control volume of each row or column of the cell, and collect it again at the outlet. The current ramps from 0 to
20 A between 200 s and 300 s. The cell is adiabatic, so the temperature drops with the endothermic electrolysis.
Look at <code>cell.pen.T</code> for the temperature field of the PEN.</p>
</html>"));
end TestCrossFlowCell;
