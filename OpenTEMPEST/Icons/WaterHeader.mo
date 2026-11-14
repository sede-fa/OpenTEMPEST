within OpenTEMPEST.Icons;
partial model WaterHeader "Icon for headers, tanks and drums"
  annotation (Icon(graphics={
        Ellipse(extent={{-60,60},{60,-60}}, lineColor={28,108,200}, fillColor={28,108,200}, fillPattern=FillPattern.Solid),
        Text(extent={{-100,-70},{100,-100}}, textString="%name", lineColor={0,0,0})}));
end WaterHeader;
