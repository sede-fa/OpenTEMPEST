within OpenTEMPEST.Interfaces;
connector DHTVolumes "Distributed heat port: one temperature and one heat flow per finite volume"
  parameter Integer N(min=1) "Number of volumes";
  Real T[N](
    each quantity="ThermodynamicTemperature",
    each unit="K",
    each displayUnit="degC",
    each min=0,
    each nominal=500) "Temperature of each volume";
  flow Real Q[N](each quantity="Power", each unit="W")
    "Heat flow of each volume (positive entering the component)";
  annotation (
    Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={255,127,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Rectangle(
          extent={{-100,40},{100,-40}},
          lineColor={255,127,0},
          fillColor={255,127,0},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>Distributed heat port for finite-volume models. Same variables as
<code>ThermoPower.Thermal.DHTVolumes</code>, so existing equations on <code>.T</code> and
<code>.Q</code> keep working after the type is renamed.</p>
</html>"));
end DHTVolumes;
