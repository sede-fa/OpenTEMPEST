within OpenTEMPEST.Blocks.Functions;
function pressureDropForchheimer "Pressure drop in a porous medium from the Darcy-Forchheimer law (viscous plus inertial loss)"
  extends Modelica.Icons.Function;

  input Modelica.Units.SI.MassFlowRate mf "Mass flow rate of the fluid";
  input Modelica.Units.SI.DynamicViscosity eta "Dynamic viscosity of the fluid";
  input Modelica.Units.SI.Density rho "Density of the fluid";
  input Modelica.Units.SI.Length L "Length of flow channel";
  input Modelica.Units.SI.Area A "Total cross-sectional area of flow channel";
  input Modelica.Units.SI.Area k "Permeability of the porous medium in the flow channel";
  input Real beta(unit="1/m") "Forchheimer (inertial resistance) coefficient; 0 gives Darcy's law";

  output Modelica.Units.SI.PressureDifference dp "Pressure loss";

algorithm
  dp := mf*eta*L/A/rho/k + beta*L*mf*abs(mf)/(A*A*rho);

  annotation (Documentation(info="<html>
<p>Darcy-Forchheimer law with the superficial velocity <code>v = mf/(rho*A)</code>:</p>
<pre>dp = (eta/k)*v*L + beta*rho*v*|v|*L</pre>
<p>The first term is the viscous (Darcy) loss, linear in the mass flow; the second is the inertial loss, quadratic in the
mass flow, that becomes important at higher velocities (in a foam or bed: when the Reynolds number based on the pore or
particle size approaches order one to ten). With <code>beta = 0</code> the function is identical to
<a href=\"modelica://OpenTEMPEST.Blocks.Functions.pressureDropDarcy\">pressureDropDarcy</a>.</p>
<p>The coefficients <code>k</code> and <code>beta</code> are properties of the porous structure and should come from
measurements or from a correlation for that structure. For open-cell metal foams there are correlations in terms of the
porosity and the pore diameter (for example by Bhattacharya, Calmidi and Mahajan, 2002); for packed beds of particles the
Ergun correlation <code>beta = 0.143/(sqrt(k)*por^1.5)</code> is used. They can give very different values, so check them
against measured pressure drops before relying on the inertial term.</p>
</html>"));
end pressureDropForchheimer;
