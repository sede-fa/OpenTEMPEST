within OpenTEMPEST.Heat;
model HeatSource1DNonUniformFV "Distributed heat source with a separate heat flow for each volume"
  parameter Integer Nw(min=1)=1 "Number of volumes";

  OpenTEMPEST.Interfaces.DHTVolumes wall(final N=Nw)
    annotation (Placement(transformation(extent={{-40,-40},{40,-20}})));
  Modelica.Blocks.Interfaces.RealInput power[Nw](each unit="W")
    "Heat flow delivered to each volume of the wall"
    annotation (Placement(transformation(
        origin={0,40},
        extent={{-20,-20},{20,20}},
        rotation=270)));

equation
  wall.Q = -power;

  annotation (
    Icon(graphics={
        Rectangle(
          extent={{-80,20},{80,-20}},
          lineColor={0,0,0},
          fillColor={191,0,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,-46},{100,-70}},
          lineColor={0,0,0},
          textString="%name")}),
    Documentation(info="<html>
<p>Prescribed heat flow into each volume of a distributed heat port: <code>power[i]</code> is the
heat flow delivered to volume <code>i</code> of the connected component.</p>
<p>Replaces <code>ThermoPower.Thermal.HeatSource1DNonUniformFV</code>.</p>
</html>"));
end HeatSource1DNonUniformFV;
