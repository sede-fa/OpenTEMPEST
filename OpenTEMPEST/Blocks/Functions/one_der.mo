within OpenTEMPEST.Blocks.Functions;
function one_der "Derivative of one"
  extends Modelica.Icons.Function;
  input Real x;
  input Real dx;
  output Real dy;
algorithm
  dy := 0;
  annotation (Inline=true);
end one_der;
