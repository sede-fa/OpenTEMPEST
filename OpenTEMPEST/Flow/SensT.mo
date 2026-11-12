within OpenTEMPEST.Flow;
model SensT "Temperature sensor for gas flows (in the flow path)"
  extends OpenTEMPEST.Flow.BaseClasses.PartialGasTwoPort;
  extends OpenTEMPEST.Icons.GasSensor;

  Medium.BaseProperties gas "Properties of the flowing gas";
  Modelica.Blocks.Interfaces.RealOutput T(unit="K") "Temperature of the flowing gas"
    annotation (Placement(transformation(extent={{-10,40},{10,60}}, rotation=90, origin={0,40})));
equation
  inlet.m_flow + outlet.m_flow = 0;
  inlet.p = outlet.p;
  gas.p = inlet.p;
  gas.h = inStream(inlet.h_outflow);
  gas.Xi = inStream(inlet.Xi_outflow);
  T = gas.T;
  annotation (Documentation(info="<html>
<p>Temperature sensor in the flow path (no pressure drop, no storage). Replaces <code>ThermoPower.Gas.SensT</code>.</p>
</html>"));
end SensT;
