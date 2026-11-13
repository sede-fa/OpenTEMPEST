## [OpenTEMPEST.Flow](OpenTEMPEST_Flow.md#opentempestflow).FluxInterpolators

### Package Content

| Name | Description |
|----|----|
| ![OpenTEMPEST.Flow.FluxInterpolators.DifferencingSchemeInterpBase](OpenTEMPEST.Flow.FluxInte941c8c4165cc8f39pBaseS.png) [DifferencingSchemeInterpBase](OpenTEMPEST_Flow_FluxInterpolators.md#opentempestflowfluxinterpolatorsdifferencingschemeinterpbase) |   |
| ![OpenTEMPEST.Flow.FluxInterpolators.UDSinterp](OpenTEMPEST.Flow.FluxInte941c8c4165cc8f39pBaseS.png) [UDSinterp](OpenTEMPEST_Flow_FluxInterpolators.md#opentempestflowfluxinterpolatorsudsinterp) | UDS: Upwind Differencing Scheme (1st Order) |
| ![OpenTEMPEST.Flow.FluxInterpolators.LUDSinterp](OpenTEMPEST.Flow.FluxInte941c8c4165cc8f39pBaseS.png) [LUDSinterp](OpenTEMPEST_Flow_FluxInterpolators.md#opentempestflowfluxinterpolatorsludsinterp) | LUDS: Linear Upwind Differencing Scheme (2nd Order) |

## [OpenTEMPEST.Flow.FluxInterpolators](OpenTEMPEST_Flow_FluxInterpolators.md#opentempestflowfluxinterpolators).DifferencingSchemeInterpBase

### Inputs

| Name   | Description                 |
|--------|-----------------------------|
| N      | Number of points in U       |
| U\[N\] | Field variable values       |
| U0     | Ghost cell value (upstream) |

### Outputs

| Name   | Description               |
|--------|---------------------------|
| Y\[N\] | Upwind differenced values |

## [OpenTEMPEST.Flow.FluxInterpolators](OpenTEMPEST_Flow_FluxInterpolators.md#opentempestflowfluxinterpolators).UDSinterp

UDS: Upwind Differencing Scheme (1st Order)

### Information

Extends from [DifferencingSchemeInterpBase](OpenTEMPEST_Flow_FluxInterpolators.md#opentempestflowfluxinterpolatorsdifferencingschemeinterpbase).

### Inputs

| Name   | Description                 |
|--------|-----------------------------|
| N      | Number of points in U       |
| U\[N\] | Field variable values       |
| U0     | Ghost cell value (upstream) |

### Outputs

| Name   | Description               |
|--------|---------------------------|
| Y\[N\] | Upwind differenced values |

## [OpenTEMPEST.Flow.FluxInterpolators](OpenTEMPEST_Flow_FluxInterpolators.md#opentempestflowfluxinterpolators).LUDSinterp

LUDS: Linear Upwind Differencing Scheme (2nd Order)

### Information

Extends from [DifferencingSchemeInterpBase](OpenTEMPEST_Flow_FluxInterpolators.md#opentempestflowfluxinterpolatorsdifferencingschemeinterpbase).

### Inputs

| Name   | Description                 |
|--------|-----------------------------|
| N      | Number of points in U       |
| U\[N\] | Field variable values       |
| U0     | Ghost cell value (upstream) |

### Outputs

| Name   | Description               |
|--------|---------------------------|
| Y\[N\] | Upwind differenced values |

[Automatically generated](http://www.3ds.com/) Sun Sep 20 19:09:47 2026.
