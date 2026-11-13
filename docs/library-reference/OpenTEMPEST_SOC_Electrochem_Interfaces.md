## [OpenTEMPEST.SOC.Electrochem](OpenTEMPEST_SOC_Electrochem.md#opentempestsocelectrochem).Interfaces

### Package Content

| Name                                                                                                                                                                                                                                          | Description                                    |
| -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| ------------------------------------------------|
| ![OpenTEMPEST.SOC.Electrochem.Interfaces.VariablesStream](OpenTEMPEST.SOC.Electrochd3dbe3657d865c02treamS.png) [VariablesStream](OpenTEMPEST_SOC_Electrochem_Interfaces.md#opentempestsocelectrocheminterfacesvariablesstream)                | Connector for connecting the cell model layers |
| ![OpenTEMPEST.SOC.Electrochem.Interfaces.SimpFlowInfoPort](OpenTEMPEST.SOC.Electroch5bfb356c56b1623boPortS.png) [SimpFlowInfoPort](OpenTEMPEST_SOC_Electrochem_Interfaces.md#opentempestsocelectrocheminterfacessimpflowinfoport)             |                                                |
| ![OpenTEMPEST.SOC.Electrochem.Interfaces.ReactionHeatInfoPort](OpenTEMPEST.SOC.Electroch5bfb356c56b1623boPortS.png) [ReactionHeatInfoPort](OpenTEMPEST_SOC_Electrochem_Interfaces.md#opentempestsocelectrocheminterfacesreactionheatinfoport) |                                                |

## ![OpenTEMPEST.SOC.Electrochem.Interfaces.VariablesStream](OpenTEMPEST.SOC.Electrochd3dbe3657d865c02treamI.png) [OpenTEMPEST.SOC.Electrochem.Interfaces](OpenTEMPEST_SOC_Electrochem_Interfaces.md#opentempestsocelectrocheminterfaces).VariablesStream

Connector for connecting the cell model layers

### Parameters

| Name     | Description |
|----------|-------------|
| nspecies |             |

### Contents

| Name          | Description |
|---------------|-------------|
| nspecies      |             |
| Y\[nspecies\] | \[mol/mol\] |
| P             | \[Pa\]      |
| I             | \[A\]       |
| I_H           | \[A\]       |
| I_C           | \[A\]       |

## ![OpenTEMPEST.SOC.Electrochem.Interfaces.SimpFlowInfoPort](OpenTEMPEST.SOC.Electroch5bfb356c56b1623boPortI.png) [OpenTEMPEST.SOC.Electrochem.Interfaces](OpenTEMPEST_SOC_Electrochem_Interfaces.md#opentempestsocelectrocheminterfaces).SimpFlowInfoPort

### Contents

| Name      | Description  |
|-----------|--------------|
| TAir      | \[K\]        |
| TFuel     | \[K\]        |
| cpAir     | \[J/(kg.K)\] |
| cpFuel    | \[J/(kg.K)\] |
| mfAir     | \[kg/s\]     |
| mfFuel    | \[kg/s\]     |
| TAirRef   | \[K\]        |
| TFuelRef  | \[K\]        |
| HfAirRef  | \[W\]        |
| HfFuelRef | \[W\]        |

## ![OpenTEMPEST.SOC.Electrochem.Interfaces.ReactionHeatInfoPort](OpenTEMPEST.SOC.Electroch5bfb356c56b1623boPortI.png) [OpenTEMPEST.SOC.Electrochem.Interfaces](OpenTEMPEST_SOC_Electrochem_Interfaces.md#opentempestsocelectrocheminterfaces).ReactionHeatInfoPort

### Contents

| Name    | Description |
|---------|-------------|
| H_r     | \[W\]       |
| Vop     | \[V\]       |
| Vid     | \[V\]       |
| I       | \[A\]       |
| TPEN    | \[K\]       |
| LHVFlow | \[W\]       |

[Automatically generated](http://www.3ds.com/) Sun Sep 20 19:09:49 2026.
