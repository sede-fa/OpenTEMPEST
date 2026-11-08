within OpenTEMPEST.Blocks.Functions;
function sqrtReg "Anti-symmetric square root approximation with finite derivative in zero"
  extends Modelica.Icons.Function;
  input Real x;
  input Real delta=0.01 "Regularisation range";
  output Real y;
algorithm
  y := x/(x*x + delta*delta)^0.25;
  annotation (Documentation(info="<html>
<p><code>y = x/(x^2 + delta^2)^0.25</code>, which tends to <code>sign(x)*sqrt(abs(x))</code> for
<code>abs(x) &gt;&gt; delta</code>. Replaces <code>ThermoPower.Functions.sqrtReg</code>.</p>
</html>"));
end sqrtReg;
