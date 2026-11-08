within OpenTEMPEST.Interfaces;
connector GasFlangeA "Gas flange (design flow direction: entering the component)"
  extends Modelica.Fluid.Interfaces.FluidPort;
  annotation (
    defaultComponentName="inlet",
    Icon(graphics={Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={159,159,223},
          fillColor={159,159,223},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>Gas flange for the design inflow side of a component. Same variables as
<code>Modelica.Fluid.Interfaces.FluidPort</code> (and <code>ThermoPower.Gas.FlangeA</code>):
<code>m_flow</code> (positive entering the component), <code>p</code>, and the stream variables
<code>h_outflow</code>, <code>Xi_outflow</code>, <code>C_outflow</code>.</p>
</html>"));
end GasFlangeA;
