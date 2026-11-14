within OpenTEMPEST.Heat;
// Derived in part from ThermoPower (Copyright 2002-2014 Politecnico di Milano, Modelica License 2). See NOTICE.md.
model Wall1D "One-dimensional wall discretised into N control volumes along x, with an inner and an outer distributed heat port"
  extends OpenTEMPEST.Icons.HeatFlow;

  import SI = Modelica.Units.SI;
  replaceable package SolidMat = OpenTEMPEST.Solid.Material.Custom
    constrainedby OpenTEMPEST.Solid.SolidMatBase annotation (choicesAllMatching=true);

  parameter Integer N(min=1) = 5 "Number of CVs along the wall";

  // Dimensions
  parameter SI.Length lX = 1 "Total length of wall (flow direction)" annotation (Dialog(group="Dimensions"));
  parameter SI.Length lY = 1 "Total width of wall" annotation (Dialog(group="Dimensions"));
  parameter SI.Length lZ = 0.01 "Total thickness of wall" annotation (Dialog(group="Dimensions"));

  parameter SI.Length dx = lX/N "x-Length of a CV" annotation (Dialog(group="Dimensions Extra"));
  parameter SI.Area Ax = lY*lZ "Cross sectional area in x plane" annotation (Dialog(group="Dimensions Extra"));
  parameter SI.Volume dV = Ax*dx "Volume of a CV" annotation (Dialog(group="Dimensions Extra"));

  // Options
  parameter Boolean axialConduction = false "Include conduction between neighbouring CVs along x"
    annotation (Dialog(group="Options"));

  // Initialisation
  parameter SI.Temperature Tstartbar = 300 "Average initial temperature" annotation (Dialog(group="Initialisation"));
  parameter SI.Temperature Tstart1 = Tstartbar "Initial temperature of first CV" annotation (Dialog(group="Initialisation"));
  parameter SI.Temperature TstartN = Tstartbar "Initial temperature of last CV" annotation (Dialog(group="Initialisation"));
  parameter SI.Temperature Tstart[N] = if N == 1 then {Tstart1} else linspace(Tstart1, TstartN, N)
    annotation (Dialog(group="Initialisation"));
  parameter OpenTEMPEST.Enumerations.InitOptions initOpt = system.initOpt "Initialisation option"
    annotation (Dialog(group="Initialisation"));

  // Custom material only
  parameter SI.ThermalConductivity kCustom_trans = 1 annotation (Dialog(group="Custom Material Only"));
  parameter SI.ThermalConductivity kCustom_long = kCustom_trans annotation (Dialog(group="Custom Material Only"));
  parameter SI.Density rhoCustom = 1 annotation (Dialog(group="Custom Material Only"));
  parameter SI.SpecificHeatCapacity cpCustom = 1 annotation (Dialog(group="Custom Material Only"));

  outer OpenTEMPEST.System system "System wide properties";

  SI.Temperature T[N](start=Tstart) "Temperature in each CV";

  SolidMat.BaseProperties solid[N](
    T=T,
    each kCustom_trans=kCustom_trans,
    each kCustom_long=kCustom_long,
    each rhoCustom=rhoCustom,
    each cpCustom=cpCustom) "Material properties object for each CV";

  SI.ThermalConductivity kv_long[N-1] "Harmonic mean of the longitudinal conductivities at internal CV boundaries";
  SI.HeatFlowRate Qax[N] "Axial heat flow into each CV";

  // Thermal ports
  OpenTEMPEST.Interfaces.DHTVolumes dhT_int(final N=N, T(start=Tstart)) "Inner surface"
    annotation (Placement(transformation(extent={{-40,20},{40,40}})));
  OpenTEMPEST.Interfaces.DHTVolumes dhT_ext(final N=N, T(start=Tstart)) "Outer surface"
    annotation (Placement(transformation(extent={{-40,-40},{40,-20}})));

initial equation
  if initOpt == OpenTEMPEST.Enumerations.InitOptions.fixedState then
    T = Tstart;
  elseif initOpt == OpenTEMPEST.Enumerations.InitOptions.steadyState then
    der(T) = zeros(N);
  end if;

equation
  // Axial conduction (harmonic mean of conductivities at the CV boundaries)
  if axialConduction and N > 1 then
    kv_long = 2*solid[1:N-1].k_long .* solid[2:N].k_long ./ (solid[1:N-1].k_long + solid[2:N].k_long);
    Qax[1] = kv_long[1]*Ax*(T[2] - T[1])/dx;
    for i in 2:N-1 loop
      Qax[i] = kv_long[i-1]*Ax*(T[i-1] - T[i])/dx + kv_long[i]*Ax*(T[i+1] - T[i])/dx;
    end for;
    Qax[N] = kv_long[N-1]*Ax*(T[N-1] - T[N])/dx;
  else
    kv_long = zeros(N-1);
    Qax = zeros(N);
  end if;

  // Energy balance
  solid.rho .* solid.cp * dV .* der(T) = dhT_int.Q + dhT_ext.Q + Qax;

  // Conduction through the half thickness to each surface
  dhT_int.Q = (solid.k_trans/(0.5*lZ))*lY*dx .* (dhT_int.T - T);
  dhT_ext.Q = (solid.k_trans/(0.5*lZ))*lY*dx .* (dhT_ext.T - T);

  annotation (Documentation(info="<html>
<p>One-dimensional wall made of <code>N</code> control volumes along x, written in the same style as
<a href=\"modelica://OpenTEMPEST.Heat.Solid1D\">Solid1D</a>. Heat enters through the inner and outer
distributed ports by conduction across half the wall thickness. Axial conduction is optional and off by default.</p>
<p>The material is a replaceable <code>SolidMat</code> package. With the default <code>Custom</code> material,
set <code>rhoCustom</code>, <code>cpCustom</code> and <code>kCustom_trans</code>.</p>
<p>It replaces <code>MetalWallFV</code>, which was derived from ThermoPower. For a total mass <code>M</code>, specific heat <code>cm</code> and
half-wall conductance <code>UA</code> use <code>rhoCustom = M/(lX*lY*lZ)</code>, <code>cpCustom = cm</code> and
<code>kCustom_trans = UA*0.5*lZ/(lX*lY)</code>.</p>
</html>"));
end Wall1D;
