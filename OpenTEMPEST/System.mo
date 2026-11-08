within OpenTEMPEST;
model System "System-wide properties (add one at the top level of every simulation model)"
  // TEMPORARY: extends ThermoPower.System so that one `inner OpenTEMPEST.System system` also satisfies the
  // ThermoPower water components (BOP) that have not been migrated yet. When the last ThermoPower
  // component is gone, replace the extends clause by the parameters
  // allowFlowReversal, p_amb, T_amb and initOpt (type OpenTEMPEST.Enumerations.InitOptions).
  extends ThermoPower.System;
  annotation (
    defaultComponentName="system",
    defaultComponentPrefixes="inner",
    missingInnerMessage="No \"system\" component is defined. Drag OpenTEMPEST.System into the top level of your model.",
    Documentation(info="<html>
<p>Provides <code>allowFlowReversal</code>, <code>p_amb</code>, <code>T_amb</code> and <code>initOpt</code> as
<code>outer system</code> to all components. Currently still based on <code>ThermoPower.System</code> (see the
comment in the source); it becomes a standalone model when ThermoPower is removed.</p>
</html>"));
end System;
