within OpenTEMPEST.Interfaces;
connector GasFlangeB "Gas flange (design flow direction: leaving the component)"
  extends Modelica.Fluid.Interfaces.FluidPort;
  annotation (
    defaultComponentName="outlet",
    Icon(graphics={Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={159,159,223},
          fillColor={159,159,223},
          fillPattern=FillPattern.Solid), Ellipse(
          extent={{-60,60},{60,-60}},
          lineColor={159,159,223},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>Gas flange for the design outflow side of a component. Same variables as
<code>GasFlangeA</code>; only the icon differs.</p>
</html>"));
end GasFlangeB;
