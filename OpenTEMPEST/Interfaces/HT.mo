within OpenTEMPEST.Interfaces;
connector HT "Lumped thermal port (temperature T, heat flow Q_flow positive entering the component)"
  extends Modelica.Thermal.HeatTransfer.Interfaces.HeatPort;
  annotation (
    Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={255,127,0},
          fillColor={255,127,0},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>Lumped thermal port. Plug-compatible with <code>Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a/b</code>
and with <code>ThermoPower.Thermal.HT</code>.</p>
</html>"));
end HT;
