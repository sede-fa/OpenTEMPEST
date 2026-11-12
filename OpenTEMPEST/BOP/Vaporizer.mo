within OpenTEMPEST.BOP;
model Vaporizer
  "Evaporator model. Input is mass flow in water. Output is water vapor as gas mix. All extensive variables are depending on the mass flow."
 import SI = Modelica.Units.SI;
 parameter Boolean thermalInput = false;
 parameter SI.AbsolutePressure pStart = 101325;
  replaceable package MediumInput = Modelica.Media.Water.StandardWater constrainedby
    Modelica.Media.Interfaces.PartialTwoPhaseMedium
    annotation(choicesAllMatching = true);
  replaceable package MediumOutput = Medium.Fuel_CH4          constrainedby Modelica.Media.Interfaces.PartialMedium
   annotation(choicesAllMatching = true);

   parameter SI.MassFlowRate mfNom = 8/1000 "Massflowrate";

  Modelica.Fluid.Interfaces.FluidPort_a waterInlet(redeclare package Medium = MediumInput)
                                           annotation (Placement(transformation(
          rotation=0, extent={{-134,-7},{-112,15}}), iconTransformation(extent={
            {-100,-100},{-48,-48}})));
  OpenTEMPEST.Interfaces.GasFlangeB gasOutlet1(redeclare package Medium = MediumOutput)
                           annotation (Placement(transformation(rotation=0,
          extent={{106,-4},{126,16}}), iconTransformation(extent={{50,50},{100,100}})));
protected
  parameter SI.MassFlowRate mfDesign = 8/1000;
  parameter Real powerDesign = mfDesign*(4.18*(100-20) + 2.26e3)*1e3*1.3;

  Modelica.Fluid.Sources.Boundary_pT sinkPressure(
    redeclare package Medium = MediumInput,
    p=100000,
    use_p_in=true,
    nPorts=1) annotation (Placement(transformation(extent={{30,-2},{10,18}})));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler drumEquilibrium1(
    redeclare package Medium = MediumInput,
    V_t=mfNom/mfDesign*0.01,
    m_D=mfNom/mfDesign*1,
    cp_D=450,
    allowFlowReversal=false,
    p_start=pStart,
    V_l_start=0.005) annotation (Placement(transformation(extent={{-68,-8},{-48,12}})));

  OpenTEMPEST.Heat.HeatSource1DFV heatSource1DFV(Nw=5) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-2,-42})));
  OpenTEMPEST.Heat.HT_DHTVolumes hT_DHTVolumes(N=5)
    annotation (Placement(transformation(extent={{-56,-46},{-42,-32}})));

  Modelica.Fluid.Sensors.MassFlowRate sensW(redeclare package Medium = MediumInput) annotation (Placement(transformation(extent={{-36,14},{-16,-6}})));

  OpenTEMPEST.Flow.SourceMassFlow sourceMassFlow(
    redeclare package Medium = MediumOutput,
    p0=100000,
    Xnom={1e-5,1e-5,1e-5,1e-5,1,1e-5},
    use_in_w0=true,
    use_in_T=true)
    annotation (Placement(transformation(extent={{42,18},{62,-2}})));

  Modelica.Fluid.Sensors.TemperatureTwoPort sensT(redeclare package Medium = MediumInput, tau=0) annotation (Placement(transformation(extent={{-18,14},{2,-6}})));

  OpenTEMPEST.Heat.MetalWallFV metalWallFV(
    Nw=5,
    M=mfNom/mfDesign*10,
    cm=450,
    WallRes=true,
    UA_ext=mfNom/mfDesign*1500,
    Tstartbar=1.1*(45.668*ln(pStart) - 426.44) + 273.15)
                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-26,-42})));

  Modelica.Fluid.Sensors.MassFlowRate sensW1(redeclare package Medium = MediumInput) annotation (Placement(transformation(extent={{-98,-12},{-78,8}})));

  OpenTEMPEST.Flow.SensP sensP(redeclare package Medium = MediumOutput)
    annotation (Placement(transformation(extent={{104,2},{84,22}})));
  Modelica.Blocks.Continuous.LimPID PIDPessure(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=0.198712,
    Ti=3.67,
    yMax=mfNom/mfDesign*powerDesign,
    yMin=0) annotation (Placement(transformation(extent={{48,-30},{28,-50}})));
  OpenTEMPEST.Electrical.Load load(Pnom(displayUnit="kW") = 5000, usePowerInput=
       true) annotation (Placement(transformation(extent={{10,-94},{30,-74}})));
  OpenTEMPEST.Interfaces.PowerConnection port annotation (Placement(
        transformation(rotation=0, extent={{20,-120},{40,-100}})));
  OpenTEMPEST.Interfaces.DHTVolumes dHTVolumes(N=5)
                                            if thermalInput
    annotation (Placement(transformation(extent={{-34,-120},{-14,-100}})));

  Modelica.Fluid.Valves.ValveLinear valveLin(
    redeclare package Medium = MediumInput,
    dp_nominal=200000,
    m_flow_nominal=mfNom) annotation (Placement(transformation(extent={{-46,14},{-34,26}})));

  Modelica.Blocks.Continuous.LimPID PIDValue(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=100,
    Ti=3.3,
    yMax=1,
    yMin=0.1/10000)
    annotation (Placement(transformation(extent={{-62,38},{-42,58}})));

  Modelica.Fluid.Sensors.Pressure sensP1(redeclare package Medium = MediumInput) annotation (Placement(transformation(extent={{-46,-4},{-26,-24}})));

  Modelica.Blocks.Sources.Ramp Valve2(
    height=0,
    duration=0,
    offset=500000,
    startTime=0)
    annotation (Placement(transformation(extent={{92,-50},{72,-30}})));

  Modelica.Fluid.Sensors.Pressure sensP2(redeclare package Medium = MediumInput) annotation (Placement(transformation(extent={{-8,12},{12,32}})));

equation
  connect(hT_DHTVolumes.HT_port, drumEquilibrium1.heatPort);
  connect(sensW.m_flow, sourceMassFlow.in_w0);
  connect(sensW.port_b, sensT.port_a);
  connect(sensT.port_b, sinkPressure.ports[1]);
  connect(sensT.T, sourceMassFlow.in_T);
  connect(hT_DHTVolumes.DHT_port, metalWallFV.int);
  connect(sensW1.port_b, drumEquilibrium1.port_a);
  connect(sensP.p, sinkPressure.p_in);
  connect(sensW1.port_a, waterInlet);
  connect(sensP.flange, gasOutlet1);
  connect(heatSource1DFV.wall, metalWallFV.ext);
  connect(port, load.port);
  connect(load.referencePower, heatSource1DFV.power);
  connect(metalWallFV.ext, dHTVolumes);
  connect(drumEquilibrium1.port_b, valveLin.port_a);
  connect(valveLin.port_b, sensW.port_a);
  connect(sensW.m_flow, PIDValue.u_m);
  connect(sensW1.m_flow, PIDValue.u_s);
  connect(sensP1.port, valveLin.port_a);
  connect(sensP1.p, PIDPessure.u_m);
  connect(Valve2.y, PIDPessure.u_s);
  connect(PIDPessure.y, heatSource1DFV.power);
  connect(PIDValue.y, valveLin.opening);
  connect(sensT.port_b, sensP2.port);
  connect(sourceMassFlow.flange, sensP.flange);
  annotation (Icon(graphics={
        Ellipse(
          extent={{-78,80},{82,-80}},
          lineColor={128,128,128},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-58,0},{-58,-6},{-56,-16},{-50,-30},{-42,-42},{-36,-46},{-30,
              -50},{-20,-56},{-14,-58},{-6,-60},{-4,-60},{2,-60},{8,-60},{14,-58},
              {24,-56},{32,-52},{38,-48},{44,-42},{50,-36},{54,-28},{60,-18},{62,
              -8},{62,0},{-58,0}},
          lineColor={128,128,128},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),
        Polygon(
          points={{-58,0},{-56,16},{-48,34},{-34,48},{-24,54},{-14,58},{-4,60},{
              2,60},{12,60},{22,56},{32,52},{38,48},{48,40},{54,30},{58,22},{60,
              14},{62,6},{62,0},{-58,0}},
          lineColor={128,128,128},
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-34,-80},{42,-100}},
          lineColor={128,128,128},
          fillColor={255,128,0},
          fillPattern=FillPattern.Solid)}));
end Vaporizer;
