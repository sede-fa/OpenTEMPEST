within OpenTEMPEST.Flow;
model SensP "Pressure sensor for gas flows (probe, no flow through it)"
  extends OpenTEMPEST.Icons.GasSensor;
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    annotation (choicesAllMatching=true);

  OpenTEMPEST.Interfaces.GasFlangeA flange(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.RealOutput p(unit="Pa") "Pressure at the flange"
    annotation (Placement(transformation(extent={{80,-20},{120,20}})));
equation
  flange.m_flow = 0;
  flange.p = p;
  // Not used while m_flow = 0, but must be defined
  flange.h_outflow = Medium.specificEnthalpy_pTX(Medium.p_default, Medium.T_default, Medium.X_default);
  flange.Xi_outflow = Medium.X_default[1:Medium.nXi];
  flange.C_outflow = Medium.C_default;
  annotation (Documentation(info="<html>
<p>Pressure probe. Replaces <code>ThermoPower.Gas.SensP</code>; output <code>p</code> is in Pa.</p>
</html>"));
end SensP;
