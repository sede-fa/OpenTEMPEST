within OpenTEMPEST.Flow;
model Plenum "Rigid adiabatic gas volume with a thermal port"
  extends OpenTEMPEST.Icons.Mixer;
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    annotation (choicesAllMatching=true);
  Medium.BaseProperties gas(
    p(start=pstart, stateSelect=StateSelect.prefer),
    T(start=Tstart, stateSelect=StateSelect.prefer),
    Xi(start=Xstart[1:Medium.nXi], each stateSelect=StateSelect.prefer));
  parameter Modelica.Units.SI.Volume V "Inner volume";
  parameter Boolean allowFlowReversal=system.allowFlowReversal
    "= true to allow flow reversal, false restricts to design direction"
    annotation (Evaluate=true);
  outer OpenTEMPEST.System system "System wide properties";
  parameter Medium.AbsolutePressure pstart=1e5 "Pressure start value"
    annotation (Dialog(tab="Initialisation"));
  parameter Medium.Temperature Tstart=300 "Temperature start value"
    annotation (Dialog(tab="Initialisation"));
  parameter Medium.MassFraction Xstart[Medium.nX]=Medium.reference_X "Start gas composition"
    annotation (Dialog(tab="Initialisation"));
  parameter OpenTEMPEST.Enumerations.InitOptions initOpt=system.initOpt "Initialisation option"
    annotation (Dialog(tab="Initialisation"));
  parameter Boolean noInitialPressure=false "Remove initial equation on pressure"
    annotation (Dialog(tab="Initialisation"), choices(checkBox=true));
  parameter Boolean noInitialTemperature=false "Remove initial equation on temperature"
    annotation (Dialog(tab="Initialisation"), choices(checkBox=true));

  Modelica.Units.SI.Mass M "Total mass";
  Modelica.Units.SI.InternalEnergy E "Total internal energy";
  Medium.SpecificEnthalpy hi "Inlet specific enthalpy";
  Medium.SpecificEnthalpy ho "Outlet specific enthalpy";
  Medium.MassFraction Xi_i[Medium.nXi] "Inlet composition";
  Medium.MassFraction Xi_o[Medium.nXi] "Outlet composition";
  Modelica.Units.SI.Time Tr "Residence time";

  OpenTEMPEST.Interfaces.GasFlangeA inlet(redeclare package Medium = Medium,
      m_flow(min=if allowFlowReversal then -Modelica.Constants.inf else 0))
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  OpenTEMPEST.Interfaces.GasFlangeB outlet(redeclare package Medium = Medium,
      m_flow(max=if allowFlowReversal then +Modelica.Constants.inf else 0))
    annotation (Placement(transformation(extent={{80,-20},{120,20}})));
  OpenTEMPEST.Interfaces.HT thermalPort "Thermal port"
    annotation (Placement(transformation(extent={{-20,60},{20,100}})));
equation
  M = gas.d*V "Gas mass";
  E = M*gas.u "Gas internal energy";
  der(M) = inlet.m_flow + outlet.m_flow "Mass balance";
  der(E) = inlet.m_flow*hi + outlet.m_flow*ho + thermalPort.Q_flow "Energy balance";
  for j in 1:Medium.nXi loop
    M*der(gas.Xi[j]) = inlet.m_flow*(Xi_i[j] - gas.Xi[j]) + outlet.m_flow*(Xi_o[j] - gas.Xi[j])
      "Independent component mass balance";
  end for;

  // Boundary conditions
  hi = homotopy(if not allowFlowReversal then inStream(inlet.h_outflow) else actualStream(inlet.h_outflow),
    inStream(inlet.h_outflow));
  Xi_i = homotopy(if not allowFlowReversal then inStream(inlet.Xi_outflow) else actualStream(inlet.Xi_outflow),
    inStream(inlet.Xi_outflow));
  ho = homotopy(if not allowFlowReversal then gas.h else actualStream(outlet.h_outflow), gas.h);
  Xi_o = homotopy(if not allowFlowReversal then gas.Xi else actualStream(outlet.Xi_outflow), gas.Xi);
  inlet.h_outflow = gas.h;
  inlet.Xi_outflow = gas.Xi;
  inlet.C_outflow = Medium.C_default;
  outlet.h_outflow = gas.h;
  outlet.Xi_outflow = gas.Xi;
  outlet.C_outflow = Medium.C_default;
  inlet.p = gas.p;
  outlet.p = gas.p;
  thermalPort.T = gas.T;

  Tr = noEvent(M/max(abs(-outlet.m_flow), Modelica.Constants.eps)) "Residence time";
initial equation
  if initOpt == OpenTEMPEST.Enumerations.InitOptions.noInit then
    // nothing
  elseif initOpt == OpenTEMPEST.Enumerations.InitOptions.fixedState then
    if not noInitialPressure then
      gas.p = pstart;
    end if;
    if not noInitialTemperature then
      gas.T = Tstart;
    end if;
    gas.Xi = Xstart[1:Medium.nXi];
  elseif initOpt == OpenTEMPEST.Enumerations.InitOptions.steadyState then
    if not noInitialPressure then
      der(gas.p) = 0;
    end if;
    if not noInitialTemperature then
      der(gas.T) = 0;
    end if;
    der(gas.Xi) = zeros(Medium.nXi);
  elseif initOpt == OpenTEMPEST.Enumerations.InitOptions.steadyStateNoP then
    if not noInitialTemperature then
      der(gas.T) = 0;
    end if;
    der(gas.Xi) = zeros(Medium.nXi);
  else
    assert(false, "Unsupported initialisation option");
  end if;
  annotation (Documentation(info="<html>
<p>Rigid adiabatic gas volume with mass, energy and species balances; heat can be exchanged through
<code>thermalPort</code>. Replaces <code>ThermoPower.Gas.Plenum</code>.</p>
</html>"));
end Plenum;
