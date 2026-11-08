within OpenTEMPEST.Flow;
model SinkPressure "Prescribed pressure sink for gas flows"
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    annotation (choicesAllMatching=true);

  parameter Medium.AbsolutePressure p0=101325 "Nominal pressure";
  parameter Medium.Temperature T=300 "Nominal temperature (used only for reverse flow)";
  parameter Medium.MassFraction Xnom[Medium.nX]=Medium.reference_X
    "Nominal gas composition (used only for reverse flow)";
  parameter OpenTEMPEST.Units.HydraulicResistance R=0
    "Hydraulic resistance (0 = ideal pressure sink)";
  parameter Boolean allowFlowReversal=system.allowFlowReversal
    "= true to allow flow reversal, false restricts to design direction"
    annotation (Evaluate=true);
  parameter Boolean use_in_p0=false "Use connector input for the pressure"
    annotation (Dialog(group="External inputs"), choices(checkBox=true));
  parameter Boolean use_in_T=false "Use connector input for the temperature"
    annotation (Dialog(group="External inputs"), choices(checkBox=true));
  parameter Boolean use_in_X=false "Use connector input for the composition"
    annotation (Dialog(group="External inputs"), choices(checkBox=true));

  outer OpenTEMPEST.System system "System wide properties";

  Medium.BaseProperties gas(
    p(start=p0),
    T(start=T),
    Xi(start=Xnom[1:Medium.nXi])) "Gas properties of the sink";

  OpenTEMPEST.Interfaces.GasFlangeA flange(redeclare package Medium = Medium,
      m_flow(min=if allowFlowReversal then -Modelica.Constants.inf else 0))
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.RealInput in_p0 if use_in_p0 "Pressure"
    annotation (Placement(transformation(
        origin={-40,50},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealInput in_T if use_in_T "Temperature"
    annotation (Placement(transformation(
        origin={0,50},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealInput in_X[Medium.nX] if use_in_X "Composition (mass fractions)"
    annotation (Placement(transformation(
        origin={40,50},
        extent={{-10,-10},{10,10}},
        rotation=270)));

protected
  Modelica.Blocks.Interfaces.RealInput in_p0_internal;
  Modelica.Blocks.Interfaces.RealInput in_T_internal;
  Modelica.Blocks.Interfaces.RealInput in_X_internal[Medium.nX];

equation
  if R > 0 then
    flange.p = gas.p + flange.m_flow*R;
  else
    flange.p = gas.p;
  end if;

  gas.p = in_p0_internal;
  if not use_in_p0 then
    in_p0_internal = p0 "Pressure set by parameter";
  end if;

  gas.T = in_T_internal;
  if not use_in_T then
    in_T_internal = T "Temperature set by parameter";
  end if;

  gas.Xi = in_X_internal[1:Medium.nXi];
  if not use_in_X then
    in_X_internal = Xnom "Composition set by parameter";
  end if;

  flange.h_outflow = gas.h;
  flange.Xi_outflow = gas.Xi;
  flange.C_outflow = Medium.C_default;

  connect(in_p0, in_p0_internal);
  connect(in_T, in_T_internal);
  connect(in_X, in_X_internal);

  annotation (
    Icon(graphics={
        Ellipse(
          extent={{-80,80},{80,-80}},
          lineColor={128,128,128},
          fillColor={159,159,223},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-20,34},{28,-26}},
          lineColor={255,255,255},
          textString="P"),
        Text(
          extent={{-100,-84},{100,-112}},
          lineColor={0,0,0},
          textString="%name")}),
    Documentation(info="<html>
<p>Pressure sink. Pressure, temperature and composition can be set by parameters or by (optional)
input connectors; temperature and composition only matter for reverse flow. With <code>R &gt; 0</code>
the sink has a linear hydraulic resistance: <code>p_flange = p0 + R*m_flow</code>.</p>
<p>Drop-in replacement for <code>ThermoPower.Gas.SinkPressure</code> (same parameter and connector names).</p>
</html>"));
end SinkPressure;
