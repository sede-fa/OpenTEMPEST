## [OpenTEMPEST.Flow](OpenTEMPEST_Flow.md#opentempestflow).BaseClasses

### Information

Extends from Modelica.Icons.BasesPackage (Icon for packages containing base classes).

### Package Content

| Name | Description |
|----|----|
| ![OpenTEMPEST.Flow.BaseClasses.simpleGasHeaterBase](OpenTEMPEST.Flow.BaseClas3186dd966e27521frBaseS.png) [simpleGasHeaterBase](OpenTEMPEST_Flow_BaseClasses.md#opentempestflowbaseclassessimplegasheaterbase) |   |
| ![OpenTEMPEST.Flow.BaseClasses.PFRBaseClass](OpenTEMPEST.Flow.BaseClas1cda771223732fbfClassS.png) [PFRBaseClass](OpenTEMPEST_Flow_BaseClasses.md#opentempestflowbaseclassespfrbaseclass) | Base Class for a 1 phase Plug flow reactor with no external mass transfer |
| ![OpenTEMPEST.Flow.BaseClasses.Flow1DBaseClass](OpenTEMPEST.Flow.BaseClas1cda771223732fbfClassS.png) [Flow1DBaseClass](OpenTEMPEST_Flow_BaseClasses.md#opentempestflowbaseclassesflow1dbaseclass) | Base class model for 1D flow model based on FVM or FDM. Can be used to build PFR models or heterogeneous catalytic reactor models |

## ![OpenTEMPEST.Flow.BaseClasses.simpleGasHeaterBase](OpenTEMPEST.Flow.BaseClas3186dd966e27521frBaseI.png) [OpenTEMPEST.Flow.BaseClasses](OpenTEMPEST_Flow_BaseClasses.md#opentempestflowbaseclasses).simpleGasHeaterBase

### Parameters

| Name | Description |
|----|----|
| replaceable package medium |   |
| l | lenght of flow channel \[m\] |
| h | height of flow channel between two parallel plates \[m\] |
| w | width of flow channel between two parallel plates \[m\] |
| d | diameter of flow channel in a pipe \[m\] |
| TStart | \[K\] |
| pStart | \[Pa\] |
| xStart\[medium.nX\] | \[1\] |
| maximalFlow | maximal mass flow rate \[kg/s\] |
| allowFlowReversal | = true to allow flow reversal, false restricts to design direction |
| pipe | = true if flow through a pipe, false if between two parallel plates |
| nParallel | number of parallel flow ducts |
| useAlphaIn | Do not colculate heat transfer but use inlet coefficient |

### Connectors

| Name                       | Description |
|----------------------------|-------------|
| replaceable package medium |             |
| inlet                      |             |
| outlet                     |             |
| alphaIn                    |             |

## ![OpenTEMPEST.Flow.BaseClasses.PFRBaseClass](OpenTEMPEST.Flow.BaseClas1cda771223732fbfClassI.png) [OpenTEMPEST.Flow.BaseClasses](OpenTEMPEST_Flow_BaseClasses.md#opentempestflowbaseclasses).PFRBaseClass

Base Class for a 1 phase Plug flow reactor with no external mass transfer

### Information

Extends from [Flow1DBaseClass](OpenTEMPEST_Flow_BaseClasses.md#opentempestflowbaseclassesflow1dbaseclass) (Base class model for 1D flow model based on FVM or FDM. Can be used to build PFR models or heterogeneous catalytic reactor models).

### Parameters

| Name | Description |
|----|----|
| replaceable package Medium |   |
| N |   |
| Ntubes | number of individual tubes |
| por | Reactor porosity, leave as 1 if no heterogenous catalyst |
| rhoCat | \[kg/m3\] |
| cpCat | \[J/(kg.K)\] |
| Initialisation |  |
| TStartIn | \[K\] |
| TStartOut | \[K\] |
| TStart\[N\] | \[K\] |
| pStart | \[Pa\] |
| xStart\[nSpecies\] | \[1\] |
| Dimensions |  |
| Rh | Hydraulic Radius single channel (Dh/2) /m \[m\] |
| omega | Wetted Perimeter single channel /m \[m\] |
| theta0_1 | Proportion of entrance and exit volumes to centre volumes /- |
| L | Length of pipe /m \[m\] |
| Acs | channel cross sectional area \[m2\] |
| Aw | HT area for one CV single channel \[m2\] |
| theta\[N, 1\] | coefficient for CV size |
| dV | Size of nominal control volume /m3 \[m3\] |
| dx | length of nominal 1D control volume /m \[m\] |

### Connectors

| Name  | Description |
|-------|-------------|
| infl  |             |
| outfl |             |

## ![OpenTEMPEST.Flow.BaseClasses.Flow1DBaseClass](OpenTEMPEST.Flow.BaseClas1cda771223732fbfClassI.png) [OpenTEMPEST.Flow.BaseClasses](OpenTEMPEST_Flow_BaseClasses.md#opentempestflowbaseclasses).Flow1DBaseClass

Base class model for 1D flow model based on FVM or FDM. Can be used to build PFR models or heterogeneous catalytic reactor models

### Parameters

| Name | Description |
|----|----|
| replaceable package Medium |   |
| N |   |
| Ntubes | number of individual tubes |
| Initialisation |  |
| TStartIn | \[K\] |
| TStartOut | \[K\] |
| TStart\[N\] | \[K\] |
| pStart | \[Pa\] |
| xStart\[nSpecies\] | \[1\] |
| Dimensions |  |
| Rh | Hydraulic Radius single channel (Dh/2) /m \[m\] |
| omega | Wetted Perimeter single channel /m \[m\] |
| theta0_1 | Proportion of entrance and exit volumes to centre volumes /- |
| L | Length of pipe /m \[m\] |
| Acs | channel cross sectional area \[m2\] |
| Aw | HT area for one CV single channel \[m2\] |
| theta\[N, 1\] | coefficient for CV size |
| dV | Size of nominal control volume /m3 \[m3\] |
| dx | length of nominal 1D control volume /m \[m\] |

### Connectors

| Name                       | Description |
|----------------------------|-------------|
| replaceable package Medium |             |
| infl                       |             |
| outfl                      |             |

[Automatically generated](http://www.3ds.com/) Sun Sep 20 19:09:47 2026.
