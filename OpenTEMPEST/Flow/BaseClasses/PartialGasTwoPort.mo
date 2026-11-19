within OpenTEMPEST.Flow.BaseClasses;
partial model PartialGasTwoPort "Gas component with an inlet and an outlet that passes mass, pressure and stream properties through"
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    annotation (choicesAllMatching=true);
  parameter Boolean allowFlowReversal=system.allowFlowReversal
    "= true to allow flow reversal, false restricts to design direction"
    annotation (Evaluate=true);
  outer OpenTEMPEST.System system "System wide properties";

  OpenTEMPEST.Interfaces.GasFlangeA inlet(redeclare package Medium = Medium,
      m_flow(min=if allowFlowReversal then -Modelica.Constants.inf else 0))
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  OpenTEMPEST.Interfaces.GasFlangeB outlet(redeclare package Medium = Medium,
      m_flow(max=if allowFlowReversal then +Modelica.Constants.inf else 0))
    annotation (Placement(transformation(extent={{80,-20},{120,20}})));

equation
  // Stream properties are passed through unchanged
  inlet.h_outflow = inStream(outlet.h_outflow);
  outlet.h_outflow = inStream(inlet.h_outflow);
  inlet.Xi_outflow = inStream(outlet.Xi_outflow);
  outlet.Xi_outflow = inStream(inlet.Xi_outflow);
  inlet.C_outflow = inStream(outlet.C_outflow);
  outlet.C_outflow = inStream(inlet.C_outflow);
end PartialGasTwoPort;
