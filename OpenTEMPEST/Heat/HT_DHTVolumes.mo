within OpenTEMPEST.Heat;
model HT_DHTVolumes "Adaptor between a lumped heat port and a distributed heat port with uniform temperature"
  extends OpenTEMPEST.Icons.HeatFlow;
  parameter Integer N=1 "Number of volumes on the distributed port";

  OpenTEMPEST.Interfaces.HT HT_port
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  OpenTEMPEST.Interfaces.DHTVolumes DHT_port(final N=N)
    annotation (Placement(transformation(extent={{80,-20},{120,20}})));
equation
  DHT_port.T = fill(HT_port.T, N) "Uniform temperature on the distributed side";
  sum(DHT_port.Q) + HT_port.Q_flow = 0 "Energy balance";
  annotation (Documentation(info="<html>
<p>Connects a lumped heat port to a distributed heat port. All volumes of the distributed port see the
temperature of the lumped port; the lumped heat flow is the sum of the volume heat flows.
Replaces <code>ThermoPower.Thermal.HT_DHTVolumes</code>.</p>
</html>"));
end HT_DHTVolumes;
