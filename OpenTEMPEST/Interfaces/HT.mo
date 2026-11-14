within OpenTEMPEST.Interfaces;
// Derived in part from ThermoPower (Copyright 2002-2014 Politecnico di Milano, Modelica License 2). See NOTICE.md.
connector HT "Lumped thermal port (temperature T, heat flow Q_flow positive entering the component)"
  extends Modelica.Thermal.HeatTransfer.Interfaces.HeatPort;
  annotation (
    Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={191,0,0},
          fillColor={191,0,0},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>Lumped thermal port. Plug-compatible with <code>Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a/b</code>
and with <code>ThermoPower.Thermal.HT</code>.</p>
</html>"));
end HT;
