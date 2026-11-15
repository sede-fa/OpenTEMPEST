within OpenTEMPEST.Flow.HeatTransfer;
model ConstantHTC "Constant heat transfer coefficient"
  extends PartialHTC;
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer alpha0 = 1 "Heat transfer coefficient";
equation
  alpha = fill(alpha0, N);
  annotation (Documentation(info="<html>
<p>Same coefficient in all control volumes. This is the default of <a href=\"modelica://OpenTEMPEST.Flow.Flow1D\">Flow1D</a>
(<code>alpha0 = h_conv</code>).</p>
</html>"));
end ConstantHTC;
