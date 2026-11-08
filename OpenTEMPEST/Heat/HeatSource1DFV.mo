within OpenTEMPEST.Heat;
model HeatSource1DFV "Distributed heat source with total power spread uniformly over the volumes"
  parameter Integer Nw(min=1)=1 "Number of volumes";

  OpenTEMPEST.Interfaces.DHTVolumes wall(final N=Nw)
    annotation (Placement(transformation(extent={{-40,-40},{40,-20}})));
  Modelica.Blocks.Interfaces.RealInput power(unit="W") "Total heat flow delivered to the wall"
    annotation (Placement(transformation(
        origin={0,40},
        extent={{-20,-20},{20,20}},
        rotation=270)));

equation
  wall.Q = -power/Nw*ones(Nw);

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
<p>Prescribed total heat flow <code>power</code>, spread equally over the <code>Nw</code> volumes of the
connected distributed heat port. Replaces <code>ThermoPower.Thermal.HeatSource1DFV</code>.</p>
</html>"));
end HeatSource1DFV;
