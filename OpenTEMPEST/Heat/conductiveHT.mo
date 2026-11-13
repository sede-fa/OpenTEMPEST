within OpenTEMPEST.Heat;
model conductiveHT "Conductive heat transfer through a layer with constant conductivity"
  extends OpenTEMPEST.Icons.HeatFlow;
  import SI = Modelica.Units.SI;
  parameter SI.ThermalConductivity lambda "thermalConductivity";
  parameter SI.Length L "length";
  parameter SI.Area A "cross sectional area";
  OpenTEMPEST.Interfaces.HT side1 annotation (
    Placement(transformation(extent = {{-40, 20}, {40, 40}}, rotation = 0)));
  OpenTEMPEST.Interfaces.HT side2 annotation (
    Placement(transformation(extent = {{-40, -20}, {40, -42}}, rotation = 0)));
equation
  side1.Q_flow = lambda * A * (side1.T - side2.T) / L
    "Conductive heat transfer";
  side1.Q_flow = -side2.Q_flow "Energy balance";
end conductiveHT;
