# Third-party notices

## ThermoPower

Parts of OpenTEMPEST were derived from the [ThermoPower](https://github.com/casella/ThermoPower)
library, Copyright (c) 2002-2014, Politecnico di Milano, licensed under the
[Modelica License 2](https://www.modelica.org/licenses/ModelicaLicense2).

OpenTEMPEST no longer depends on ThermoPower. The following files were adapted from ThermoPower
components or connectors (interfaces and variable names kept for compatibility, equations
rewritten on top of Modelica Standard Library 4.1 where applicable). Each carries a note at the top.
Those files remain subject to the Modelica License 2 terms in addition to the repository licence
(BSD 3-Clause); the rest of the library is BSD 3-Clause only.

| OpenTEMPEST file | ThermoPower origin |
|---|---|
| `Enumerations/InitOptions.mo` | `ThermoPower.Choices.Init.Options` |
| `System.mo` | `ThermoPower.System` |
| `Interfaces/GasFlangeA.mo`, `GasFlangeB.mo` | `ThermoPower.Gas.FlangeA/B` |
| `Interfaces/HT.mo`, `DHTVolumes.mo` | `ThermoPower.Thermal.HT`, `DHTVolumes` |
| `Interfaces/PowerConnection.mo` | `ThermoPower.Electrical.PowerConnection` |
| `Flow/FlowJoin.mo`, `FlowSplit.mo`, `PressDropLin.mo`, `SensP.mo`, `SensT.mo`, `SensW.mo`, `SinkPressure.mo`, `SourceMassFlow.mo`, `ThroughMassFlow.mo` | `ThermoPower.Gas.*` of the same name |
| `Heat/ConvHTFV.mo`, `HeatSource1DFV.mo`, `HeatSource1DNonUniformFV.mo`, `HT_DHTVolumes.mo` | `ThermoPower.Thermal.*` of the same name |
| `Heat/Wall1D.mo` | `ThermoPower.Thermal.MetalWallFV` |
| `Heat/ForcedConvection.mo` | heat transfer plug-in for `ThermoPower.Gas.Flow1DFV` |
| `Electrical/Grid.mo`, `Load.mo` | `ThermoPower.Electrical.Grid`, `Load` |
