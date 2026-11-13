## [OpenTEMPEST.BOP](OpenTEMPEST_BOP.md#opentempestbop).Reactors

### Package Content

| Name | Description |
|----|----|
| ![OpenTEMPEST.BOP.Reactors.Reformer1D](OpenTEMPEST.BOP.Reactors.Reformer1DS.png) [Reformer1D](OpenTEMPEST_BOP_Reactors.md#opentempestbopreactorsreformer1d) |   |
| ![OpenTEMPEST.BOP.Reactors.Reformer1D_C3](OpenTEMPEST.BOP.Reactors.Reformer1DS.png) [Reformer1D_C3](OpenTEMPEST_BOP_Reactors.md#opentempest-bop-reactors-reformer1d_c3) |   |
| ![OpenTEMPEST.BOP.Reactors.Combustor0D](OpenTEMPEST.BOP.Reactors.Combustor0DS.png) [Combustor0D](OpenTEMPEST_BOP_Reactors.md#opentempestbopreactorscombustor0d) | 0D combustor assuming complete combustion of fuels. Needs lambda \>=1 |
| ![OpenTEMPEST.BOP.Reactors.MeOH](OpenTEMPEST.Solid.SolidMatBaseS.png) [MeOH](OpenTEMPEST_BOP_Reactors_MeOH.md#opentempestbopreactorsmeoh) |   |

## ![OpenTEMPEST.BOP.Reactors.Reformer1D](OpenTEMPEST.BOP.Reactors.Reformer1DI.png) [OpenTEMPEST.BOP.Reactors](OpenTEMPEST_BOP_Reactors.md#opentempestbopreactors).Reformer1D

### Information

Extends from [Flow.BaseClasses.PFRBaseClass](OpenTEMPEST_Flow_BaseClasses.md#opentempestflowbaseclassespfrbaseclass) (Base Class for a 1 phase Plug flow reactor with no external mass transfer).

### Parameters

| Name | Description |
|----|----|
| replaceable package Medium |   |
| N |   |
| Ntubes | number of individual tubes |
| por | Reactor porosity, leave as 1 if no heterogenous catalyst |
| rhoCat | \[kg/m3\] |
| cpCat | \[J/(kg.K)\] |
| Fac_ref |   |
| Fac_wgs |   |
| A_sf |   |
| Ea_sf |   |
| A_rf |   |
| Ea_rf |   |
| dpdx | Constant pressure gradient Pa/m |
| Uconv | Overall HTC /W/m2/K \[W/(m2.K)\] |
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

| Name                       | Description                 |
|----------------------------|-----------------------------|
| replaceable package Medium |                             |
| infl                       |                             |
| outfl                      |                             |
| wall                       | HT through cylindrical wall |

## ![OpenTEMPEST.BOP.Reactors.Reformer1D_C3](OpenTEMPEST.BOP.Reactors.Reformer1DI.png) [OpenTEMPEST.BOP.Reactors](OpenTEMPEST_BOP_Reactors.md#opentempestbopreactors).Reformer1D_C3

### Information

Extends from [Flow.BaseClasses.PFRBaseClass](OpenTEMPEST_Flow_BaseClasses.md#opentempestflowbaseclassespfrbaseclass) (Base Class for a 1 phase Plug flow reactor with no external mass transfer).

### Parameters

| Name | Description |
|----|----|
| replaceable package Medium |   |
| N |   |
| Ntubes | number of individual tubes |
| por | Reactor porosity, leave as 1 if no heterogenous catalyst |
| rhoCat | \[kg/m3\] |
| cpCat | \[J/(kg.K)\] |
| lambda | \[W/(m.K)\] |
| A1 |   |
| A2 |   |
| A3 |   |
| Ea1 |   |
| Ea2 |   |
| Ea3 |   |
| alpha3 |   |
| beta3 |   |
| UA |   |
| dpdxNom |   |
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

| Name                       | Description                 |
|----------------------------|-----------------------------|
| replaceable package Medium |                             |
| infl                       |                             |
| outfl                      |                             |
| wall                       | HT through cylindrical wall |

## ![OpenTEMPEST.BOP.Reactors.Combustor0D](OpenTEMPEST.BOP.Reactors.Combustor0DI.png) [OpenTEMPEST.BOP.Reactors](OpenTEMPEST_BOP_Reactors.md#opentempestbopreactors).Combustor0D

0D combustor assuming complete combustion of fuels. Needs lambda \>=1

### Parameters

| Name                 | Description                            |
|----------------------|----------------------------------------|
| V                    | Inner volume \[m3\]                    |
| S                    | Inner surface \[m2\]                   |
| gamma                | Heat Transfer Coefficient \[W/(m2.K)\] |
| Cm                   | Metal Heat Capacity \[J/K\]            |
| Initialisation       |                                        |
| Tmstart              | Metal wall start temperature \[K\]     |
| pstart               | Pressure start value \[Pa\]            |
| Tstart               | Temperature start value \[K\]          |
| Xstart\[Exhaust.nX\] | Start flue gas composition \[kg/kg\]   |

### Connectors

| Name | Description |
|------|-------------|
| ina  | inlet air   |
| inf  | inlet fuel  |
| out  | flue gas    |

[Automatically generated](http://www.3ds.com/) Sun Sep 20 19:09:47 2026.
