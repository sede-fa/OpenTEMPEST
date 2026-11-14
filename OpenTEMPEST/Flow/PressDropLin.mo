within OpenTEMPEST.Flow;
model PressDropLin "Linear pressure drop with pressure difference output"
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    annotation (choicesAllMatching=true);
  parameter OpenTEMPEST.Units.HydraulicResistance R "Hydraulic resistance";
  parameter Boolean allowFlowReversal=system.allowFlowReversal
    annotation (Evaluate=true);
  outer OpenTEMPEST.System system "System wide properties";

  OpenTEMPEST.Interfaces.GasFlangeA inlet(redeclare package Medium = Medium,
      m_flow(min=if allowFlowReversal then -Modelica.Constants.inf else 0))
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  OpenTEMPEST.Interfaces.GasFlangeB outlet(redeclare package Medium = Medium,
      m_flow(max=if allowFlowReversal then +Modelica.Constants.inf else 0))
    annotation (Placement(transformation(extent={{80,-20},{120,20}})));

  Medium.AbsolutePressure dp "Pressure drop inlet - outlet";

equation
  // Mass balance (no storage)
  inlet.m_flow + outlet.m_flow = 0;

  // Momentum balance
  dp = inlet.p - outlet.p;
  dp = R*inlet.m_flow;

  // Stream variables are passed through unchanged
  inlet.h_outflow = inStream(outlet.h_outflow);
  outlet.h_outflow = inStream(inlet.h_outflow);
  inlet.Xi_outflow = inStream(outlet.Xi_outflow);
  outlet.Xi_outflow = inStream(inlet.Xi_outflow);
  inlet.C_outflow = inStream(outlet.C_outflow);
  outlet.C_outflow = inStream(inlet.C_outflow);

  annotation (
    Icon(graphics={
        Rectangle(
          extent={{-100,40},{100,-40}},
          lineColor={128,128,128},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,-50},{100,-80}},
          lineColor={0,0,0},
          textString="%name"),
        Text(
          extent={{-60,30},{60,-30}},
          lineColor={0,0,0},
          textString="R")}),
    Documentation(info="<html>
<p>Linear pressure drop <code>inlet.p - outlet.p = R*m_flow</code>, with no mass or energy storage.
Replaces <code>ThermoPower.Gas.PressDropLin</code>; also exposes the pressure drop as <code>dp</code>.</p>
</html>"));
end PressDropLin;
