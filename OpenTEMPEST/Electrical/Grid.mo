within OpenTEMPEST.Electrical;
// Derived in part from ThermoPower (Copyright 2002-2014 Politecnico di Milano, Modelica License 2). See NOTICE.md.
model Grid "Ideal grid with finite droop"
  parameter Modelica.Units.SI.Power Pgrid "Total nominal power installed on the grid";
  final parameter Modelica.Units.SI.Power Poff(fixed=false)
    "Offset that guarantees f = fnom at initialisation";
  parameter Real droop=0.05 "Grid droop (per unit)";
  final parameter Modelica.Units.SI.Frequency fnom=system.fnom "Nominal frequency";
  constant Real pi=Modelica.Constants.pi;
  outer OpenTEMPEST.System system "System object";

  OpenTEMPEST.Interfaces.PowerConnection port
    annotation (Placement(transformation(extent={{-100,-14},{-72,14}}),
        iconTransformation(extent={{-100,-14},{-72,14}})));
  Modelica.Units.SI.Frequency f "Grid frequency";
equation
  der(port.theta) = 2*pi*f;
  f = fnom*(1 + droop*(port.P - Poff)/Pgrid);
initial equation
  port.theta = 0 "Initial reference angle for the synchronously connected components";
  f = fnom "Nominal frequency at initialisation - sets Poff";
  annotation (
    Icon(graphics={
        Ellipse(extent={{-40,40},{40,-40}}, lineColor={0,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),
        Line(points={{-72,0},{-40,0}}, color={0,0,0}),
        Text(extent={{-40,20},{40,-20}}, textString="~", lineColor={0,0,0}),
        Text(extent={{-100,-50},{100,-80}}, textString="%name", lineColor={0,0,0})}),
    Documentation(info="<html>
<p>Ideal grid with a finite droop: the grid frequency changes with the active power injected through the port,
<code>f = fnom*(1 + droop*(P - Poff)/Pgrid)</code>, and equals the nominal frequency at initialisation.
Replaces <code>ThermoPower.Electrical.Grid</code>.</p>
</html>"));
end Grid;
