within OpenTEMPEST.Heat;
model MetalWallFV "Metal wall with Nw finite volumes and an internal and an external distributed heat port"
  extends OpenTEMPEST.Icons.HeatFlow;
  parameter Integer Nw(min=1)=1 "Number of volumes on the wall ports";
  parameter Modelica.Units.SI.Mass M "Mass";
  parameter Modelica.Units.SI.SpecificHeatCapacity cm "Specific heat capacity of the metal";
  parameter Modelica.Units.SI.HeatCapacity Cm=M*cm "Heat capacity of the wall";
  parameter Boolean WallRes=false "Wall thermal resistance accounted for";
  parameter Modelica.Units.SI.ThermalConductance UA_ext=0
    "Equivalent thermal conductance of the outer half-wall" annotation (Dialog(enable=WallRes));
  parameter Modelica.Units.SI.ThermalConductance UA_int=UA_ext
    "Equivalent thermal conductance of the inner half-wall" annotation (Dialog(enable=WallRes));
  parameter Modelica.Units.SI.Temperature Tstartbar=300 "Average temperature"
    annotation (Dialog(tab="Initialisation"));
  parameter Modelica.Units.SI.Temperature Tstart1=Tstartbar "Temperature start value - first volume"
    annotation (Dialog(tab="Initialisation"));
  parameter Modelica.Units.SI.Temperature TstartN=Tstartbar "Temperature start value - last volume"
    annotation (Dialog(tab="Initialisation"));
  parameter Modelica.Units.SI.Temperature Tvolstart[Nw]=
      if Nw == 1 then {Tstart1} else linspace(Tstart1, TstartN, Nw)
    annotation (Dialog(tab="Initialisation"));
  parameter OpenTEMPEST.Enumerations.InitOptions initOpt=system.initOpt "Initialisation option"
    annotation (Dialog(tab="Initialisation"));
  outer OpenTEMPEST.System system "System wide properties";

  Modelica.Units.SI.Temperature Tvol[Nw](start=Tvolstart) "Volume temperatures";
  OpenTEMPEST.Interfaces.DHTVolumes int(final N=Nw, T(start=Tvolstart)) "Internal surface"
    annotation (Placement(transformation(extent={{-40,20},{40,40}})));
  OpenTEMPEST.Interfaces.DHTVolumes ext(final N=Nw, T(start=Tvolstart)) "External surface"
    annotation (Placement(transformation(extent={{-40,-40},{40,-20}})));
equation
  (Cm/Nw)*der(Tvol) = int.Q + ext.Q "Energy balance";
  if WallRes then
    assert(UA_int > 0 and UA_ext > 0, "Assign positive values to UA_int, UA_ext");
    ext.Q = (ext.T - Tvol)*UA_ext/Nw;
    int.Q = (int.T - Tvol)*UA_int/Nw;
  else
    // No temperature gradient across the thickness
    ext.T = Tvol;
    int.T = Tvol;
  end if;
initial equation
  if initOpt == OpenTEMPEST.Enumerations.InitOptions.noInit then
    // nothing
  elseif initOpt == OpenTEMPEST.Enumerations.InitOptions.fixedState then
    Tvol = Tvolstart;
  elseif initOpt == OpenTEMPEST.Enumerations.InitOptions.steadyState then
    der(Tvol) = zeros(Nw);
  elseif initOpt == OpenTEMPEST.Enumerations.InitOptions.steadyStateNoP then
    // wall has no pressure: nothing
  else
    assert(false, "Unsupported initialisation option");
  end if;
  annotation (Documentation(info="<html>
<p>Metal wall divided in <code>Nw</code> finite volumes, each with heat capacity <code>Cm/Nw</code>.
With <code>WallRes = true</code> the two half-walls have a thermal conductance <code>UA_int</code> and <code>UA_ext</code>
(shared between the volumes); otherwise the wall is isothermal across its thickness.
Replaces <code>ThermoPower.Thermal.MetalWallFV</code>.</p>
</html>"));
end MetalWallFV;
