## [OpenTEMPEST.BOP.GasConditioning](OpenTEMPEST_BOP_GasConditioning.md#opentempestbopgasconditioning).HexEtaTypes

### Package Content

| Name | Description |
|----|----|
| ![OpenTEMPEST.BOP.GasConditioning.HexEtaTypes.EtaBase](OpenTEMPEST.BOP.GasConditdcde269ce0b8c23faBaseS.png) [EtaBase](OpenTEMPEST_BOP_GasConditioning_HexEtaTypes.md#opentempestbopgasconditioninghexetatypesetabase) |   |
| ![OpenTEMPEST.BOP.GasConditioning.HexEtaTypes.ConstantEta](OpenTEMPEST.BOP.GasConditdcde269ce0b8c23faBaseS.png) [ConstantEta](OpenTEMPEST_BOP_GasConditioning_HexEtaTypes.md#opentempestbopgasconditioninghexetatypesconstanteta) |   |
| ![OpenTEMPEST.BOP.GasConditioning.HexEtaTypes.NTU_FixedUA](OpenTEMPEST.BOP.GasConditdcde269ce0b8c23faBaseS.png) [NTU_FixedUA](OpenTEMPEST_BOP_GasConditioning_HexEtaTypes.md#opentempest-bop-gasconditioning-hexetatypes-ntu_fixedua) |   |
| ![OpenTEMPEST.BOP.GasConditioning.HexEtaTypes.NTU_VarUA](OpenTEMPEST.BOP.GasConditdcde269ce0b8c23faBaseS.png) [NTU_VarUA](OpenTEMPEST_BOP_GasConditioning_HexEtaTypes.md#opentempest-bop-gasconditioning-hexetatypes-ntu_varua) |   |

## [OpenTEMPEST.BOP.GasConditioning.HexEtaTypes](OpenTEMPEST_BOP_GasConditioning_HexEtaTypes.md#opentempestbopgasconditioninghexetatypes).EtaBase

### Parameters

| Name                        | Description |
|-----------------------------|-------------|
| replaceable package MediumA |             |
| replaceable package MediumB |             |

### Connectors

| Name                        | Description |
|-----------------------------|-------------|
| replaceable package MediumA |             |
| replaceable package MediumB |             |

## [OpenTEMPEST.BOP.GasConditioning.HexEtaTypes](OpenTEMPEST_BOP_GasConditioning_HexEtaTypes.md#opentempestbopgasconditioninghexetatypes).ConstantEta

### Information

Extends from [EtaBase](OpenTEMPEST_BOP_GasConditioning_HexEtaTypes.md#opentempestbopgasconditioninghexetatypesetabase).

### Parameters

| Name                        | Description |
|-----------------------------|-------------|
| replaceable package MediumA |             |
| replaceable package MediumB |             |
| etaNom                      |             |

## [OpenTEMPEST.BOP.GasConditioning.HexEtaTypes](OpenTEMPEST_BOP_GasConditioning_HexEtaTypes.md#opentempestbopgasconditioninghexetatypes).NTU_FixedUA

### Information

Extends from [EtaBase](OpenTEMPEST_BOP_GasConditioning_HexEtaTypes.md#opentempestbopgasconditioninghexetatypesetabase).

### Parameters

| Name                           | Description |
|--------------------------------|-------------|
| replaceable package MediumA    |             |
| replaceable package MediumB    |             |
| UA                             |             |
| replaceable function NTUmethod |             |

### Connectors

| Name                           | Description |
|--------------------------------|-------------|
| replaceable function NTUmethod |             |

## [OpenTEMPEST.BOP.GasConditioning.HexEtaTypes](OpenTEMPEST_BOP_GasConditioning_HexEtaTypes.md#opentempestbopgasconditioninghexetatypes).NTU_VarUA

### Information

Extends from [EtaBase](OpenTEMPEST_BOP_GasConditioning_HexEtaTypes.md#opentempestbopgasconditioninghexetatypesetabase).

### Parameters

| Name                           | Description |
|--------------------------------|-------------|
| replaceable package MediumA    |             |
| replaceable package MediumB    |             |
| b                              |             |
| mf_NomA                        |             |
| mf_NomB                        |             |
| hA_RefA                        |             |
| hA_RefB                        |             |
| TnomA                          |             |
| TnomB                          |             |
| PnomA                          |             |
| PnomB                          |             |
| XnomA\[MediumA.nXi\]           |             |
| XnomB\[MediumB.nXi\]           |             |
| replaceable function NTUmethod |             |

### Connectors

| Name                           | Description |
|--------------------------------|-------------|
| replaceable function NTUmethod |             |

[Automatically generated](http://www.3ds.com/) Sun Sep 20 19:09:47 2026.
