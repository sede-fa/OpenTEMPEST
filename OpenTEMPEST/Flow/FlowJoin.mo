within OpenTEMPEST.Flow;
// Derived in part from ThermoPower (Copyright 2002-2014 Politecnico di Milano, Modelica License 2). See NOTICE.md.
model FlowJoin "Ideal 2-to-1 gas junction (mass and momentum balance, ideal mixing of streams)"
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    annotation (choicesAllMatching=true);
  // Accepted for compatibility with ThermoPower.Gas.FlowJoin. The junction always supports
  // flow in either direction, so these flags have no effect.
  parameter Boolean allowFlowReversal=true "Accepted for compatibility; has no effect";
  parameter Boolean checkFlowDirection=false "Accepted for compatibility; has no effect";
  parameter Boolean rev_inlet1=true "Accepted for compatibility; has no effect";
  parameter Boolean rev_inlet2=true "Accepted for compatibility; has no effect";
  parameter Boolean rev_outlet=true "Accepted for compatibility; has no effect";

  OpenTEMPEST.Interfaces.GasFlangeA inlet1(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
  OpenTEMPEST.Interfaces.GasFlangeA inlet2(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
  OpenTEMPEST.Interfaces.GasFlangeB outlet(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{80,-20},{120,20}})));

protected
  // Inflow weights (flow entering the junction through each port); regularised to avoid 0/0
  Real w_in[3] = {max(inlet1.m_flow, 1e-10), max(inlet2.m_flow, 1e-10), max(outlet.m_flow, 1e-10)};
  Medium.SpecificEnthalpy h_in[3] = {inStream(inlet1.h_outflow), inStream(inlet2.h_outflow), inStream(outlet.h_outflow)};
  Medium.MassFraction Xi_in[3, Medium.nXi] = {inStream(inlet1.Xi_outflow), inStream(inlet2.Xi_outflow), inStream(outlet.Xi_outflow)};
equation
  // Mass and momentum balance
  inlet1.m_flow + inlet2.m_flow + outlet.m_flow = 0;
  inlet2.p = inlet1.p;
  outlet.p = inlet1.p;

  // Ideal mixing of whatever flows into the junction through the other two ports
  inlet1.h_outflow = (w_in[2]*h_in[2] + w_in[3]*h_in[3])/(w_in[2] + w_in[3]);
  inlet2.h_outflow = (w_in[1]*h_in[1] + w_in[3]*h_in[3])/(w_in[1] + w_in[3]);
  outlet.h_outflow = (w_in[1]*h_in[1] + w_in[2]*h_in[2])/(w_in[1] + w_in[2]);
  for i in 1:Medium.nXi loop
    inlet1.Xi_outflow[i] = (w_in[2]*Xi_in[2, i] + w_in[3]*Xi_in[3, i])/(w_in[2] + w_in[3]);
    inlet2.Xi_outflow[i] = (w_in[1]*Xi_in[1, i] + w_in[3]*Xi_in[3, i])/(w_in[1] + w_in[3]);
    outlet.Xi_outflow[i] = (w_in[1]*Xi_in[1, i] + w_in[2]*Xi_in[2, i])/(w_in[1] + w_in[2]);
  end for;
  inlet1.C_outflow = inStream(outlet.C_outflow);
  inlet2.C_outflow = inStream(outlet.C_outflow);
  outlet.C_outflow = inStream(inlet1.C_outflow);

  annotation (
    Icon(graphics={
        Polygon(points={{-100,40},{-100,-40},{0,-40},{100,-40},{100,40},{0,40},{-100,40}},
          lineColor={28,108,200}, fillColor={28,108,200}, fillPattern=FillPattern.Solid),
        Text(extent={{-100,-50},{100,-80}}, textString="%name", lineColor={0,0,0})}),
    Documentation(info="<html>
<p>Ideal junction with two inlets and one outlet: mass balance, equal pressure at all ports, and ideal
mixing of the streams that enter the junction. Flow may go in either direction. Replaces
<code>ThermoPower.Gas.FlowJoin</code>.</p>
</html>"));
end FlowJoin;
