within OpenTEMPEST.Heat;
// Derived in part from ThermoPower (Copyright 2002-2014 Politecnico di Milano, Modelica License 2). See NOTICE.md.
model TempSource1DFV "Uniform temperature source for a distributed heat port (finite volumes)"
  parameter Integer Nw(min=1) = 1 "Number of volumes on the wall port";

  OpenTEMPEST.Interfaces.DHTVolumes wall(final N=Nw)
    annotation (Placement(transformation(extent={{-40,-40},{40,-20}})));
  Modelica.Blocks.Interfaces.RealInput temperature(unit="K") "Temperature"
    annotation (Placement(transformation(
        origin={0,40},
        extent={{-20,-20},{20,20}},
        rotation=270)));

equation
  wall.T = fill(temperature, Nw);

  annotation (
    Icon(graphics={
        Rectangle(
          extent={{-80,20},{80,-20}},
          lineColor={0,0,0},
          fillColor={255,127,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,-46},{100,-70}},
          lineColor={0,0,0},
          textString="%name")}),
    Documentation(info="<html>
<p>Ideal uniform temperature source for a distributed heat port: all <code>Nw</code> volumes are held at the
temperature given by the <code>temperature</code> input. Replaces <code>ThermoPower.Thermal.TempSource1DFV</code>.
For one temperature per volume use <a href=\"modelica://OpenTEMPEST.Heat.PrescribedTemperature1D\">PrescribedTemperature1D</a>.</p>
</html>"));
end TempSource1DFV;
