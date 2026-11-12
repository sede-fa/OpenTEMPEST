within OpenTEMPEST.Blocks.Functions;
function pressureDropDarcy
  "Calculates the pressure drop in a porous medium using Darcy's law"
  extends Modelica.Icons.Function;

  input Modelica.Units.SI.MassFlowRate mf "Mass flow rate of the fluid";
  input Modelica.Units.SI.DynamicViscosity eta "Dynamic viscosity of the fluid";
  input Modelica.Units.SI.Density rho "Density of the fluid";
  input Modelica.Units.SI.Length L "length of flow channel";
  input Modelica.Units.SI.Area A "Total cross-sectional area of flow channel";
  input Modelica.Units.SI.Area k "Permeability of the porous medium in the flow channel";

  output Modelica.Units.SI.PressureDifference dp "Pressure loss";

algorithm

  dp := mf*eta*L/A/rho/k;

end pressureDropDarcy;
