# Migrating from OpenTEMPEST 0.1.x to 0.2.0

0.2.0 runs on Modelica Standard Library 4.1.0 and no longer needs ThermoPower. Interfaces and most
component names were kept, so most models only need renamed classes.

## Automatic part

`OpenTEMPEST/Resources/Scripts/Dymola/ConvertOpenTEMPEST_from_0.1.0.mos` renames the used ThermoPower
classes to the OpenTEMPEST ones (connectors, `System`, init options, gas sensors/sources/sinks, thermal
and electrical components). Dymola runs it when you open a model whose `uses` annotation names
OpenTEMPEST 0.1.0 and a conversion to 0.2.0 is requested; you can also run it by hand:

```modelica
RunScript("<path>/OpenTEMPEST/Resources/Scripts/Dymola/ConvertOpenTEMPEST_from_0.1.0.mos");
```

Also update your own `uses` annotation to `OpenTEMPEST(version="0.2.0")`, `Modelica(version="4.1.0")`.
The Dymola script itself is untested in Dymola. OpenModelica does not understand `convertClass`, so
there is also a plain Python version that reads the same rename list from the `.mos` file:

```bash
python3 Misc/scripts/convert_from_0.1.0.py --dry-run path/to/your/models   # preview
python3 Misc/scripts/convert_from_0.1.0.py path/to/your/models             # convert in place
```

It also updates the `uses` versions. Tested on a small model using the old names (converted file passes
`checkModel` in OpenModelica); review the result with a diff.

## Manual part

| 0.1.x | 0.2.0 |
|---|---|
| `Heat.MetalWallFV` | `Heat.Wall1D` (material via `SolidMat`; for a lumped wall use `rhoCustom=M/(lX*lY*lZ)`, `cpCustom=cm`) |
| `Flow.Plenum` | `Modelica.Fluid.Vessels.ClosedVolume` |
| `Blocks.Functions.sqrtReg` | `Modelica.Fluid.Utilities.regRoot` |
| `ThermoPower.Gas.Flow1DFV` etc. | not part of OpenTEMPEST; use `Modelica.Fluid.Pipes.DynamicPipe` or the OpenTEMPEST channel models |
| MSL 3.2.3 `Modelica.SIunits` | `Modelica.Units.SI` (Dymola converts this itself) |
| Air channel `pDrop` (linear drop) | now only a start value; pressure drop comes from `kPerm` / `betaForch` (Darcy-Forchheimer) |
