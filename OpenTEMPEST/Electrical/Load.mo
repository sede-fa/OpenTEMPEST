within OpenTEMPEST.Electrical;
model Load "Electrical load drawing a reference active power from the grid"
  parameter Modelica.Units.SI.Power Pnom "Nominal active power consumption";
  parameter Boolean usePowerInput=false "Use input connector for the power reference";
  replaceable function powerCurve = OpenTEMPEST.Blocks.Functions.one
    "Normalised power consumption versus normalised frequency deviation (default: constant)"
    annotation (Inline=true);
  final parameter Modelica.Units.SI.Frequency fnom=system.fnom "Nominal frequency";
  constant Real pi=Modelica.Constants.pi;
  outer OpenTEMPEST.System system "System object";

  OpenTEMPEST.Interfaces.PowerConnection port
    annotation (Placement(transformation(extent={{-14,72},{14,100}}),
        iconTransformation(extent={{-14,72},{14,100}})));
  Modelica.Blocks.Interfaces.RealInput referencePower if usePowerInput
    "Reference active power consumption"
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
        iconTransformation(extent={{-120,-20},{-80,20}})));

  Modelica.Units.SI.Power P "Actual active power consumption";
  Modelica.Units.SI.Power Pref "Reference active power consumption";
  Modelica.Units.SI.Frequency f "Grid frequency";

protected
  Modelica.Blocks.Interfaces.RealInput referencePower_int "Internal power reference";
equation
  if not usePowerInput then
    referencePower_int = Pnom;
  end if;
  Pref = referencePower_int;
  connect(referencePower, referencePower_int);

  P = Pref*powerCurve((f - fnom)/fnom);
  f = der(port.theta)/(2*pi);
  P = port.P;

  annotation (
    Icon(graphics={
        Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),
        Line(points={{0,40},{0,74}}, color={0,0,0}),
        Line(points={{0,-40},{0,-68}}, color={0,0,0}),
        Line(points={{16,-68},{-16,-68}}, color={0,0,0}),
        Line(points={{8,-76},{-8,-76}}, color={0,0,0}),
        Text(extent={{-100,-90},{100,-120}}, textString="%name", lineColor={0,0,0})}),
    Documentation(info="<html>
<p>Electrical load. The active power drawn from the grid is the reference power (parameter <code>Pnom</code>, or the
<code>referencePower</code> input if <code>usePowerInput</code>) multiplied by <code>powerCurve</code> of the
normalised frequency deviation; the default curve is constant, so the load does not depend on frequency.
Replaces <code>ThermoPower.Electrical.Load</code>.</p>
</html>"));
end Load;
