within OpenTEMPEST;
model System "System-wide properties (add one at the top level of every simulation model)"
  parameter Boolean allowFlowReversal=true
    "= false to restrict components to their design flow direction"
    annotation (Evaluate=true);
  parameter Real p_amb(
    quantity="Pressure",
    unit="Pa",
    displayUnit="bar") = 101325 "Ambient pressure";
  parameter Real T_amb(
    quantity="ThermodynamicTemperature",
    unit="K",
    displayUnit="degC") = 293.15 "Ambient temperature";
  parameter OpenTEMPEST.Enumerations.InitOptions initOpt=OpenTEMPEST.Enumerations.InitOptions.noInit
    "Default initialisation option for components that support it";
  annotation (
    defaultComponentName="system",
    defaultComponentPrefixes="inner",
    missingInnerMessage="No \"system\" component is defined. Drag OpenTEMPEST.System into the top level of your model.",
    Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-100,40},{100,-40}},
          lineColor={0,0,255},
          textString="system")}),
    Documentation(info="<html>
<p>Replaces <code>ThermoPower.System</code>. Provides <code>allowFlowReversal</code>, <code>p_amb</code>,
<code>T_amb</code> and <code>initOpt</code> as <code>outer system</code> to all components.</p>
</html>"));
end System;
