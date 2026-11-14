within OpenTEMPEST.Flow;
// Derived in part from ThermoPower (Copyright 2002-2014 Politecnico di Milano, Modelica License 2). See NOTICE.md.
model ThroughMassFlow "Prescribed mass flow rate through a gas flow path"
  extends OpenTEMPEST.Flow.BaseClasses.PartialGasTwoPort;
  extends OpenTEMPEST.Icons.GasSource;

  parameter Medium.MassFlowRate w0=0 "Nominal mass flow rate";
  parameter Boolean use_in_w0=false "Use connector input for the mass flow rate"
    annotation (Dialog(group="External inputs"), choices(checkBox=true));

  Modelica.Blocks.Interfaces.RealInput in_w0 if use_in_w0 "Mass flow rate"
    annotation (Placement(transformation(
        origin={0,50},
        extent={{-10,-10},{10,10}},
        rotation=270)));
protected
  Modelica.Blocks.Interfaces.RealInput in_w0_internal;
equation
  if not use_in_w0 then
    in_w0_internal = w0;
  end if;
  connect(in_w0, in_w0_internal);

  inlet.m_flow = in_w0_internal;
  inlet.m_flow + outlet.m_flow = 0;
  // The pressure drop is whatever the prescribed flow requires: inlet.p and outlet.p are free
  annotation (Documentation(info="<html>
<p>Prescribes the mass flow rate through the component; the pressure difference follows from the
surrounding network. Replaces <code>ThermoPower.Gas.ThroughMassFlow</code>.</p>
</html>"));
end ThroughMassFlow;
