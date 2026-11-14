within OpenTEMPEST.Heat;
// Derived in part from ThermoPower (Copyright 2002-2014 Politecnico di Milano, Modelica License 2). See NOTICE.md.
model ConvHTFV "Constant thermal conductance between two distributed heat ports"
  parameter Integer Nv(min=1)=2 "Number of volumes";
  parameter Real G(quantity="ThermalConductance", unit="W/K")
    "Total thermal conductance, shared equally between the Nv volumes";

  OpenTEMPEST.Interfaces.DHTVolumes side1(final N=Nv)
    annotation (Placement(transformation(extent={{-40,20},{40,40}})));
  OpenTEMPEST.Interfaces.DHTVolumes side2(final N=Nv)
    annotation (Placement(transformation(extent={{-40,-42},{40,-20}})));

equation
  side1.Q = G/Nv*(side1.T - side2.T);
  side1.Q + side2.Q = zeros(Nv);

  annotation (
    Icon(graphics={
        Rectangle(
          extent={{-80,20},{80,-20}},
          lineColor={0,0,0},
          fillColor={255,127,0},
          fillPattern=FillPattern.Forward),
        Text(
          extent={{-100,-46},{100,-70}},
          lineColor={0,0,0},
          textString="%name")}),
    Documentation(info="<html>
<p>Heat transfer between two distributed heat ports through a constant conductance:
<code>side1.Q[i] = G/Nv*(side1.T[i] - side2.T[i])</code>, <code>side2.Q = -side1.Q</code>.</p>
<p>Replaces <code>ThermoPower.Thermal.ConvHTFV</code>.</p>
</html>"));
end ConvHTFV;
