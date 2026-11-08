within OpenTEMPEST;
package Interfaces "Connectors used throughout OpenTEMPEST"
  annotation (Documentation(info="<html>
<p>
Connectors owned by OpenTEMPEST. They replace the ThermoPower connectors that were used before
(<code>ThermoPower.Gas.FlangeA/B</code>, <code>ThermoPower.Thermal.HT</code> and
<code>ThermoPower.Thermal.DHTVolumes</code>) and keep the same variable names, so models only need
the type name changed when they are migrated.
</p>
<ul>
<li><code>GasFlangeA/B</code> extend <code>Modelica.Fluid.Interfaces.FluidPort</code>, so they can be
connected directly to Modelica.Fluid components and (during the migration) to ThermoPower gas flanges.</li>
<li><code>HT</code> extends <code>Modelica.Thermal.HeatTransfer.Interfaces.HeatPort</code>
(variables <code>T</code> and <code>Q_flow</code>).</li>
<li><code>DHTVolumes</code> is a distributed heat port with one temperature <code>T[N]</code> and one heat flow
<code>Q[N]</code> per finite volume. <code>Q</code> is positive when heat enters the component.</li>
</ul>
<p>
These connectors only use classes that exist in both MSL 3.2.3 and MSL 4.x.
</p>
</html>"));
end Interfaces;
