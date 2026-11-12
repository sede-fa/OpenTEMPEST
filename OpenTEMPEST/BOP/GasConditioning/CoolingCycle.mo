within OpenTEMPEST.BOP.GasConditioning;
model CoolingCycle "Heat exchanger with integrated water cycle."
  import SI = Modelica.SIunits;
  import Medi = Modelica.Media.Interfaces.PartialMedium;

  replaceable package MediumHeating = Modelica.Media.Interfaces.PartialMedium
    annotation(choicesAllMatching = true);

  replaceable package MediumCooling = Modelica.Media.Interfaces.PartialMedium
   annotation(choicesAllMatching = true);

  package MediumLoop = Modelica.Media.Water.WaterIF97_pT "Water in the closed cooling loop";

  parameter SI.Volume VExpansionTank = 1 "Inner volume";
  parameter SI.ThermalConductance UACooling = 63800/10 "Termal conductence";
  parameter SI.Distance LHeat = 1 "Heat tube lenght";
  parameter SI.Distance DHeat = 0.05 "Heat tube diameter";
  parameter SI.Length omegaHeat = 0.157
    "Perimeter of heat transfer surface (single heat tube)";
  parameter Medi.MassFlowRate wnomHeat = 0.1 "Heat Nominal mass flowrate (total)";
  parameter Medi.MassFlowRate wnomCooling = 1 "Cooling Nominal mass flowrate (total)";

  replaceable function flowCharacteristicPump =
      Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.baseFlow
    "Head vs. V_flow characteristic at nominal speed and density"
    annotation (choicesAllMatching=true);

  Modelica.Fluid.Machines.PrescribedPump pump(
    redeclare package Medium = MediumLoop,
    redeclare function flowCharacteristic = flowCharacteristicPump,
    use_powerCharacteristic=false,
    redeclare function efficiencyCharacteristic =
        Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency (eta_nominal=0.8),
    nParallel=1,
    N_nominal=500,
    rho_nominal=1000,
    use_N_in=true,
    checkValve=false,
    m_flow_start=1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={50,-4})));
  Modelica.Fluid.Pipes.DynamicPipe flow1DFV(
    redeclare package Medium = MediumLoop,
    nNodes=4,
    length=1,
    isCircular=false,
    diameter=4*(0.002)/(0.157),
    crossArea=0.002,
    perimeter=0.157,
    use_HeatTransfer=true,
    redeclare model HeatTransfer = Modelica.Fluid.Pipes.BaseClasses.HeatTransfer.IdealFlowHeatTransfer,
    redeclare model FlowModel = Modelica.Fluid.Pipes.BaseClasses.FlowModels.NominalLaminarFlow(dp_nominal=1000, m_flow_nominal=1)) annotation (Placement(transformation(extent={{14,18},{-6,38}})));
  Modelica.Fluid.Pipes.DynamicPipe flow1DFV1(
    redeclare package Medium = MediumLoop,
    nNodes=4,
    length=1,
    isCircular=false,
    diameter=4*(0.002)/(0.157),
    crossArea=0.002,
    perimeter=0.157,
    use_HeatTransfer=true,
    redeclare model HeatTransfer = Modelica.Fluid.Pipes.BaseClasses.HeatTransfer.IdealFlowHeatTransfer,
    redeclare model FlowModel = Modelica.Fluid.Pipes.BaseClasses.FlowModels.NominalLaminarFlow(dp_nominal=1000, m_flow_nominal=1)) annotation (Placement(transformation(extent={{-4,-24},{16,-44}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort SensT_A_in(redeclare package Medium = MediumLoop, tau=0) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-48,12})));

  OpenTEMPEST.Heat.MetalWallFV metalWallFV(
    Nw=4,
    M=2,
    cm=900,
    WallRes=true,
    UA_ext=UACooling)
    annotation (Placement(transformation(extent={{-4,-66},{16,-46}})));
  OpenTEMPEST.Heat.MetalWallFV metalWallFV1(
    Nw=4,
    M=2,
    cm=900,
    WallRes=true,
    UA_ext=15000/10)
    annotation (Placement(transformation(extent={{-6,56},{14,36}})));

  Modelica.Fluid.Pipes.DynamicPipe flow1DFV2(
    redeclare package Medium = MediumCooling,
    nNodes=4,
    length=1,
    isCircular=false,
    diameter=4*(0.196)/(1.57),
    crossArea=0.196,
    perimeter=1.57,
    use_HeatTransfer=true,
    redeclare model HeatTransfer = Modelica.Fluid.Pipes.BaseClasses.HeatTransfer.IdealFlowHeatTransfer,
    redeclare model FlowModel = Modelica.Fluid.Pipes.BaseClasses.FlowModels.NominalLaminarFlow(dp_nominal=1000, m_flow_nominal=wnomCooling)) annotation (Placement(transformation(extent={{18,-90},{-2,-70}})));

  OpenTEMPEST.BOP.GasConditioning.ExpansionTank expansionTank(
    redeclare package Medium = MediumLoop,
    V=VExpansionTank,
    S=1,
    FluidPhaseStart=OpenTEMPEST.Enumerations.FluidPhases.Liquid,
    pstart=100000,
    gasShareStart=0.9)
    annotation (Placement(transformation(extent={{28,-44},{48,-24}})));

  Modelica.Fluid.Pipes.DynamicPipe flow1DFV3(
    redeclare package Medium = MediumHeating,
    nNodes=4,
    length=LHeat,
    isCircular=false,
    diameter=DHeat,
    crossArea=AHeat,
    perimeter=omegaHeat,
    use_HeatTransfer=true,
    redeclare model HeatTransfer =
        Modelica.Fluid.Pipes.BaseClasses.HeatTransfer.ConstantFlowHeatTransfer (alpha0=100/(omegaHeat*LHeat)),
    redeclare model FlowModel = Modelica.Fluid.Pipes.BaseClasses.FlowModels.NominalLaminarFlow(dp_nominal=1000, m_flow_nominal=wnomHeat)) annotation (Placement(transformation(extent={{-6,82},{14,62}})));

  Modelica.Blocks.Continuous.LimPID PID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=-11.59,
    Ti=8,
    yMax=180,
    yMin=40)
    annotation (Placement(transformation(extent={{-70,-40},{-50,-60}})));
  Modelica.Blocks.Interfaces.RealInput u_s annotation (Placement(transformation(
          rotation=0, extent={{-120,-50},{-100,-30}})));
  Modelica.Fluid.Interfaces.FluidPort_a waterInlet(redeclare package Medium = MediumCooling)
                                           annotation (Placement(transformation(
          rotation=0, extent={{90,-108},{110,-88}}),  iconTransformation(extent={{50,-148},
            {110,-88}})));
  Modelica.Fluid.Interfaces.FluidPort_b waterOutlet(redeclare package Medium =
        MediumCooling)                     annotation (Placement(transformation(
          rotation=0, extent={{-110,-112},{-90,-92}}), iconTransformation(
          extent={{-144,-146},{-90,-92}})));
  OpenTEMPEST.Interfaces.GasFlangeA gasInlet(redeclare package Medium = MediumHeating)
    annotation (Placement(transformation(rotation=0, extent={{-110,90},{-90,110}}),
        iconTransformation(extent={{-144,92},{-90,146}})));
  OpenTEMPEST.Interfaces.GasFlangeB gasOutlet(redeclare package Medium = MediumHeating)
                           annotation (Placement(transformation(rotation=0,
          extent={{88,88},{108,108}}), iconTransformation(extent={{94,90},{150,146}})));
  Modelica.Blocks.Interfaces.RealOutput TR
    annotation (Placement(transformation(extent={{-110,6},{-90,26}})));

  OpenTEMPEST.Heat.HTs_DHT adapterLoopHeated(N=4) "Loop pipe (heated side) to wall"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={0,-130})));
  OpenTEMPEST.Heat.HTs_DHT adapterLoopCooled(N=4) "Loop pipe (cooled side) to wall"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={40,-130})));
  OpenTEMPEST.Heat.HTs_DHT adapterCooling(N=4) "Cooling water pipe to wall"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={80,-130})));
  OpenTEMPEST.Heat.HTs_DHT adapterHeating(N=4) "Heating gas pipe to wall"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={120,-130})));
protected
  parameter SI.Area AHeat = 3.14159*DHeat^2/4;
equation
  connect(pump.port_b, flow1DFV.port_a);
  connect(flow1DFV.port_b, SensT_A_in.port_a);
  connect(metalWallFV.int, adapterLoopCooled.DHT_port);
  connect(adapterLoopCooled.HT_ports, flow1DFV1.heatPorts);
  connect(metalWallFV1.int, adapterLoopHeated.DHT_port);
  connect(adapterLoopHeated.HT_ports, flow1DFV.heatPorts);
  connect(adapterCooling.HT_ports, flow1DFV2.heatPorts);
  connect(adapterCooling.DHT_port, metalWallFV.ext);
  connect(SensT_A_in.port_b, flow1DFV1.port_a);
  connect(flow1DFV1.port_b, expansionTank.inlet);
  connect(expansionTank.outlet, pump.port_a);
  connect(adapterHeating.HT_ports, flow1DFV3.heatPorts);
  connect(adapterHeating.DHT_port, metalWallFV1.ext);
  connect(SensT_A_in.T, PID.u_m);
  connect(u_s, PID.u_s);
  connect(waterInlet, flow1DFV2.port_a);
  connect(waterOutlet, flow1DFV2.port_b);
  connect(gasInlet, flow1DFV3.port_a);
  connect(gasOutlet, flow1DFV3.port_b);
  connect(SensT_A_in.T, TR);
  connect(PID.y, pump.N_in);
  annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                                                                   lineColor={28,
              108,200}), Text(
          extent={{-8,12},{6,8}},
          lineColor={28,108,200},
          textString="fdh"),
        Rectangle(
          extent={{-94,80},{92,72}},
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-92,-84},{94,-92}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-86,56},{90,-72}},
          lineColor={0,255,255},
          fillColor={85,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-70,38},{72,-52}},
          lineColor={0,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-42,14},{48,-30}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.None,
          textStyle={TextStyle.Bold,TextStyle.Italic,TextStyle.UnderLine},
          textString="Cooling cycle")}));
end CoolingCycle;
