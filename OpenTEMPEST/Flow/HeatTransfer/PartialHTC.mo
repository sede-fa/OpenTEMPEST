within OpenTEMPEST.Flow.HeatTransfer;
partial model PartialHTC "Base class for convective heat transfer coefficient models of 1D channels"
  parameter Integer N(min=1) "Number of control volumes";
  parameter Modelica.Units.SI.Length Dh "Hydraulic diameter of the channel";

  input Modelica.Units.SI.ThermalConductivity lambda[N] "Thermal conductivity of the gas";
  input Modelica.Units.SI.ReynoldsNumber Re[N] "Reynolds number in the channel";
  input Modelica.Units.SI.PrandtlNumber Pr[N] "Prandtl number of the gas";

  output Modelica.Units.SI.CoefficientOfHeatTransfer alpha[N] "Heat transfer coefficient";
end PartialHTC;
