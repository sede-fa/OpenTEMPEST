within OpenTEMPEST.Icons;
partial model WaterPump "Icon for pumps"
  annotation (Icon(graphics={
        Ellipse(extent={{-60,60},{60,-60}}, lineColor={0,0,255}, fillColor={0,128,255}, fillPattern=FillPattern.Solid),
        Polygon(points={{-30,52},{-60,-60},{60,-60},{30,52},{-30,52}}, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),
        Text(extent={{-100,-70},{100,-100}}, textString="%name", lineColor={0,0,0})}));
end WaterPump;
