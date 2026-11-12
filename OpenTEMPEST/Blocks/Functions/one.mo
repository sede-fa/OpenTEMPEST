within OpenTEMPEST.Blocks.Functions;
function one "Constant function returning 1 (default power curve of Electrical.Load)"
  extends Modelica.Icons.Function;
  input Real x;
  output Real y;
algorithm
  y := 1;
  annotation (Inline=true, derivative=one_der);
end one;
