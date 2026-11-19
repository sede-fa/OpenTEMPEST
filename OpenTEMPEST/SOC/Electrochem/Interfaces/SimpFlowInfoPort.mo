within OpenTEMPEST.SOC.Electrochem.Interfaces;
connector SimpFlowInfoPort "Connector carrying flow information for simplified cell blocks"

  Modelica.Units.SI.Temperature TAir;
  Modelica.Units.SI.Temperature TFuel;
  Modelica.Units.SI.SpecificHeatCapacityAtConstantPressure cpAir;
  Modelica.Units.SI.SpecificHeatCapacityAtConstantPressure cpFuel;
  Modelica.Units.SI.MassFlowRate mfAir;
  Modelica.Units.SI.MassFlowRate mfFuel;

  Modelica.Units.SI.Temperature TAirRef;
  Modelica.Units.SI.Temperature TFuelRef;
  Modelica.Units.SI.EnergyFlowRate HfAirRef;
  Modelica.Units.SI.EnergyFlowRate HfFuelRef;

  annotation (Icon(graphics={                                                                                                              Polygon(
          origin={9.74,0},
          fillColor={230,230,230},
          fillPattern=FillPattern.Solid,
          points={{-89.7391,98},{-89.7391,-98},{90.2609,0},{90.2609,0},{-89.7391,
              98}})}));
end SimpFlowInfoPort;
