within OpenTEMPEST.SOC.Electrochem.Interfaces;
connector ReactionHeatInfoPort "Connector carrying reaction heat, voltages, current and PEN temperature"
  Modelica.Units.SI.EnthalpyFlowRate H_r;
  Modelica.Units.SI.Voltage Vop;
  Modelica.Units.SI.Voltage Vid;
  Modelica.Units.SI.Current I;
  Modelica.Units.SI.Temperature TPEN;
  Modelica.Units.SI.EnthalpyFlowRate LHVFlow;

  annotation (
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Polygon(origin = {9.74, 0}, fillColor = {230, 230, 230},
            fillPattern =                                                                                                   FillPattern.Solid, points = {{-89.7391, 98}, {-89.7391, -98}, {90.2609, 0}, {90.2609, 0}, {-89.7391, 98}})}));
end ReactionHeatInfoPort;
