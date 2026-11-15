within OpenTEMPEST.Flow;
package HeatTransfer "Heat transfer coefficient models for 1D gas flow models"
  extends Modelica.Icons.Package;
  annotation (Documentation(info="<html>
<p>Models for the convective heat transfer coefficient between the gas and the wall in
<a href=\"modelica://OpenTEMPEST.Flow.Flow1D\">Flow1D</a>. They are replaceable: derive from
<a href=\"modelica://OpenTEMPEST.Flow.HeatTransfer.PartialHTC\">PartialHTC</a> and redeclare <code>htc</code> to add a correlation.</p>
</html>"));
end HeatTransfer;
