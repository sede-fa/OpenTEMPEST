within OpenTEMPEST.Solid;
partial package SolidMatBase "Base package for solid materials with temperature dependent rho, k and cp"

  constant OpenTEMPEST.Solid.solidMaterialsRecord data;

  model BaseProperties "Temperature dependent k, cp and rho calculated from the coefficients in data"

  Modelica.Units.SI.Density rho "density, kg/m³";
    Modelica.Units.SI.SpecificHeatCapacity cp "heat capacity, J/kg/K";
    Modelica.Units.SI.ThermalConductivity k_long "heat conductivity in longitudinal direction of layering";
    Modelica.Units.SI.ThermalConductivity k_trans "heat conductivity in transversal direction of layering";
    input Modelica.Units.SI.Temperature T "temperature, K";
    parameter Modelica.Units.SI.ThermalConductivity kCustom_trans = 1 "heat conductivity in transversal direction of layering";
    parameter Modelica.Units.SI.ThermalConductivity kCustom_long = 1 "heat conductivity in longitudinal direction of layering";
    parameter Modelica.Units.SI.SpecificHeatCapacity cpCustom = 1 "heat capacity, J/kg/K";
    parameter Modelica.Units.SI.Density rhoCustom = 1 "density, kg/m³";

  equation

    if not data.name == "Custom" then
      k_trans =OpenTEMPEST.Blocks.Functions.polySolid(T, data.cK_trans);
      k_long =OpenTEMPEST.Blocks.Functions.polySolid(T, data.cK_long);
      cp =OpenTEMPEST.Blocks.Functions.polySolid(T, data.cCp);
      rho =OpenTEMPEST.Blocks.Functions.polySolid(T, data.cRho);
    else
      k_trans = kCustom_trans;
      k_long = kCustom_long;
      cp = cpCustom;
      rho = rhoCustom;
    end if;

  end BaseProperties;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end SolidMatBase;
