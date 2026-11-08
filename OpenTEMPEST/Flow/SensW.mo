within OpenTEMPEST.Flow;
model SensW "Mass flow rate sensor for gas flows (in the flow path)"
  extends OpenTEMPEST.Flow.BaseClasses.PartialGasTwoPort;
  extends OpenTEMPEST.Icons.GasSensor;

  Modelica.Blocks.Interfaces.RealOutput w(unit="kg/s") "Mass flow rate in design direction"
    annotation (Placement(transformation(extent={{-10,40},{10,60}}, rotation=90, origin={0,40})));
equation
  inlet.m_flow + outlet.m_flow = 0;
  inlet.p = outlet.p;
  w = inlet.m_flow;
  annotation (Documentation(info="<html>
<p>Mass flow sensor in the flow path (no pressure drop, no storage). Replaces <code>ThermoPower.Gas.SensW</code>.</p>
</html>"));
end SensW;
