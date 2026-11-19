within OpenTEMPEST;
// Derived in part from ThermoPower (Copyright 2002-2014 Politecnico di Milano, Modelica License 2). See NOTICE.md.
model System "System-wide properties (add one at the top level of every simulation model)"
  extends Modelica.Fluid.System;
  parameter Modelica.Units.SI.Frequency fnom=50 "Nominal grid frequency (Electrical package)";
  parameter OpenTEMPEST.Enumerations.InitOptions initOpt=OpenTEMPEST.Enumerations.InitOptions.noInit
    "Default initialisation option for OpenTEMPEST components that support it";
  final parameter Modelica.Units.SI.Temperature T_amb=T_ambient "Ambient temperature (alias of T_ambient)";
  final parameter Modelica.Units.SI.AbsolutePressure p_amb=p_ambient "Ambient pressure (alias of p_ambient)";
  annotation (
    defaultComponentName="system",
    defaultComponentPrefixes="inner",
    missingInnerMessage="No \"system\" component is defined. Drag OpenTEMPEST.System into the top level of your model.",
    Documentation(info="<html>
<p>System object for OpenTEMPEST. It extends <code>Modelica.Fluid.System</code>, so a single
<code>inner OpenTEMPEST.System system</code> also satisfies every Modelica.Fluid component. It adds the nominal grid frequency
<code>fnom</code> (used by <code>Electrical</code>), the default initialisation option <code>initOpt</code>, and the aliases
<code>T_amb</code> and <code>p_amb</code> that ThermoPower models used.</p>
</html>"));
end System;
