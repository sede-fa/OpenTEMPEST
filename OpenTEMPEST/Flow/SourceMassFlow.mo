within OpenTEMPEST.Flow;
model SourceMassFlow "Prescribed mass flow rate source for gas flows"
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    annotation (choicesAllMatching=true);

  parameter Medium.AbsolutePressure p0=101325 "Nominal pressure";
  parameter Medium.Temperature T=300 "Nominal temperature";
  parameter Medium.MassFraction Xnom[Medium.nX]=Medium.reference_X
    "Nominal gas composition";
  parameter Medium.MassFlowRate w0=0 "Nominal mass flow rate";
  parameter OpenTEMPEST.Units.HydraulicConductance G=0
    "Hydraulic conductance (0 = ideal flow source)";
  parameter Boolean allowFlowReversal=system.allowFlowReversal
    "= true to allow flow reversal, false restricts to design direction"
    annotation (Evaluate=true);
  parameter Boolean use_in_w0=false "Use connector input for the mass flow rate"
    annotation (Dialog(group="External inputs"), choices(checkBox=true));
  parameter Boolean use_in_T=false "Use connector input for the temperature"
    annotation (Dialog(group="External inputs"), choices(checkBox=true));
  parameter Boolean use_in_X=false "Use connector input for the composition"
    annotation (Dialog(group="External inputs"), choices(checkBox=true));

  outer OpenTEMPEST.System system "System wide properties";

  Medium.BaseProperties gas(
    p(start=p0),
    T(start=T),
    Xi(start=Xnom[1:Medium.nXi])) "Gas properties at the outlet";
  Medium.MassFlowRate w "Mass flow rate leaving the source";

  OpenTEMPEST.Interfaces.GasFlangeB flange(redeclare package Medium = Medium,
      m_flow(max=if allowFlowReversal then +Modelica.Constants.inf else 0))
    annotation (Placement(transformation(extent={{80,-20},{120,20}})));
  Modelica.Blocks.Interfaces.RealInput in_w0 if use_in_w0 "Mass flow rate"
    annotation (Placement(transformation(
        origin={-60,50},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealInput in_T if use_in_T "Temperature"
    annotation (Placement(transformation(
        origin={0,50},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealInput in_X[Medium.nX] if use_in_X "Composition (mass fractions)"
    annotation (Placement(transformation(
        origin={60,50},
        extent={{-10,-10},{10,10}},
        rotation=270)));

protected
  Modelica.Blocks.Interfaces.RealInput in_w0_internal;
  Modelica.Blocks.Interfaces.RealInput in_T_internal;
  Modelica.Blocks.Interfaces.RealInput in_X_internal[Medium.nX];

equation
  if G > 0 then
    flange.m_flow = -w + (flange.p - p0)*G;
  else
    flange.m_flow = -w;
  end if;

  w = in_w0_internal;
  if not use_in_w0 then
    in_w0_internal = w0 "Flow rate set by parameter";
  end if;

  gas.T = in_T_internal;
  if not use_in_T then
    in_T_internal = T "Temperature set by parameter";
  end if;

  gas.Xi = in_X_internal[1:Medium.nXi];
  if not use_in_X then
    in_X_internal = Xnom "Composition set by parameter";
  end if;

  flange.p = gas.p;
  flange.h_outflow = gas.h;
  flange.Xi_outflow = gas.Xi;
  flange.C_outflow = Medium.C_default;

  connect(in_w0, in_w0_internal);
  connect(in_T, in_T_internal);
  connect(in_X, in_X_internal);

  annotation (
    Icon(graphics={
        Rectangle(
          extent={{-80,40},{80,-40}},
          lineColor={128,128,128},
          fillColor={159,159,223},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-12,-20},{66,0},{-12,20},{34,0},{-12,-20}},
          lineColor={128,128,128},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,-52},{100,-80}},
          lineColor={0,0,0},
          textString="%name")}),
    Documentation(info="<html>
<p>Ideal mass flow rate source. Mass flow rate, temperature and composition can be set by parameters
or by (optional) input connectors. With <code>G &gt; 0</code> the source has a linear hydraulic
conductance: <code>m_flow = w0 + G*(p - p0)</code> leaving the source.</p>
<p>Drop-in replacement for <code>ThermoPower.Gas.SourceMassFlow</code> (same parameter and connector names).</p>
</html>"));
end SourceMassFlow;
