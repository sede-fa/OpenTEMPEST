within OpenTEMPEST.Flow;
// Derived in part from ThermoPower (Copyright 2002-2014 Politecnico di Milano, Modelica License 2). See NOTICE.md.
model FlowSplit "Ideal 1-to-2 gas junction (mass and momentum balance, ideal mixing of streams)"
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    annotation (choicesAllMatching=true);
  // Accepted for compatibility with ThermoPower.Gas.FlowSplit. The junction always supports
  // flow in either direction, so these flags have no effect.
  parameter Boolean allowFlowReversal=true "Accepted for compatibility; has no effect";
  parameter Boolean checkFlowDirection=false "Accepted for compatibility; has no effect";
  parameter Boolean rev_inlet=true "Accepted for compatibility; has no effect";
  parameter Boolean rev_outlet1=true "Accepted for compatibility; has no effect";
  parameter Boolean rev_outlet2=true "Accepted for compatibility; has no effect";

  OpenTEMPEST.Interfaces.GasFlangeA inlet(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  OpenTEMPEST.Interfaces.GasFlangeB outlet1(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{80,40},{120,80}})));
  OpenTEMPEST.Interfaces.GasFlangeB outlet2(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{80,-80},{120,-40}})));

  // Inflow weights (flow entering the junction through each port); regularised to avoid 0/0
protected
  Real w_in[3] = {max(inlet.m_flow, 1e-10), max(outlet1.m_flow, 1e-10), max(outlet2.m_flow, 1e-10)};
  Medium.SpecificEnthalpy h_in[3] = {inStream(inlet.h_outflow), inStream(outlet1.h_outflow), inStream(outlet2.h_outflow)};
  Medium.MassFraction Xi_in[3, Medium.nXi] = {inStream(inlet.Xi_outflow), inStream(outlet1.Xi_outflow), inStream(outlet2.Xi_outflow)};
equation
  // Mass and momentum balance
  inlet.m_flow + outlet1.m_flow + outlet2.m_flow = 0;
  outlet1.p = inlet.p;
  outlet2.p = inlet.p;

  // Ideal mixing of whatever flows into the junction through the other two ports
  inlet.h_outflow = (w_in[2]*h_in[2] + w_in[3]*h_in[3])/(w_in[2] + w_in[3]);
  outlet1.h_outflow = (w_in[1]*h_in[1] + w_in[3]*h_in[3])/(w_in[1] + w_in[3]);
  outlet2.h_outflow = (w_in[1]*h_in[1] + w_in[2]*h_in[2])/(w_in[1] + w_in[2]);
  for i in 1:Medium.nXi loop
    inlet.Xi_outflow[i] = (w_in[2]*Xi_in[2, i] + w_in[3]*Xi_in[3, i])/(w_in[2] + w_in[3]);
    outlet1.Xi_outflow[i] = (w_in[1]*Xi_in[1, i] + w_in[3]*Xi_in[3, i])/(w_in[1] + w_in[3]);
    outlet2.Xi_outflow[i] = (w_in[1]*Xi_in[1, i] + w_in[2]*Xi_in[2, i])/(w_in[1] + w_in[2]);
  end for;
  inlet.C_outflow = inStream(outlet1.C_outflow);
  outlet1.C_outflow = inStream(inlet.C_outflow);
  outlet2.C_outflow = inStream(inlet.C_outflow);

  annotation (
    Icon(graphics={
        Polygon(points={{-100,40},{-100,-40},{0,-40},{100,-40},{100,40},{0,40},{-100,40}},
          lineColor={28,108,200}, fillColor={28,108,200}, fillPattern=
              FillPattern.Solid),
        Text(extent={{-100,-50},{100,-80}}, textString="%name", lineColor={0,0,0})}),
    Documentation(info="<html>
<p>Ideal junction with one inlet and two outlets: mass balance, equal pressure at all ports, and ideal
mixing of the streams that enter the junction. Flow may go in either direction. Replaces
<code>ThermoPower.Gas.FlowSplit</code>.</p>
</html>"));
end FlowSplit;
