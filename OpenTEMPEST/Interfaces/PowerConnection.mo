within OpenTEMPEST.Interfaces;
// Derived in part from ThermoPower (Copyright 2002-2014 Politecnico di Milano, Modelica License 2). See NOTICE.md.
connector PowerConnection "Electrical power connector (active power and voltage angle)"
  flow Modelica.Units.SI.Power P "Active power flow into the port";
  Modelica.Units.SI.Angle theta "Voltage angle in a frame rotating at nominal frequency";
  annotation (
    Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>Simplified AC power connector: the flow variable is the active power <code>P</code> entering the component,
the potential variable is the voltage angle <code>theta</code>; the grid frequency follows from
<code>der(theta)/(2*pi)</code>. Same variables as <code>ThermoPower.Electrical.PowerConnection</code>.</p>
</html>"));
end PowerConnection;
