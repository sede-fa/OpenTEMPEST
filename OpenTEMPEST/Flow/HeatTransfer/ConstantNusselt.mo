within OpenTEMPEST.Flow.HeatTransfer;
model ConstantNusselt "Heat transfer coefficient from a constant Nusselt number, alpha = Nu*lambda/Dh"
  extends PartialHTC;
  parameter Real Nu = 3.66 "Nusselt number (3.66: fully developed laminar flow in a circular tube, constant wall temperature)";
equation
  alpha = Nu*lambda/Dh;
  annotation (Documentation(info="<html>
<p>The coefficient follows the gas conductivity (and so its temperature) but not the flow. Replace it with a model using
<code>Re</code> and <code>Pr</code> (for example a Dittus-Boelter or Gnielinski correlation) for turbulent flow.</p>
</html>"));
end ConstantNusselt;
