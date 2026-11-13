## [OpenTEMPEST.Solid](OpenTEMPEST_Solid.md#opentempestsolid).SolidMatBase

determines properties of solid material as function of temperature

### Package Content

| Name                                                                                                                                                                                    | Description                                                                                                   |
| -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| ---------------------------------------------------------------------------------------------------------------|
| data                                                                                                                                                                                    |                                                                                                               |
| ![OpenTEMPEST.Solid.SolidMatBase.BaseProperties](OpenTEMPEST.Examples.ExampleModelS.png) [BaseProperties](OpenTEMPEST_Solid_SolidMatBase.md#opentempestsolidsolidmatbasebaseproperties) | model that calls function for T-dependent k,cp,rho with coefficients in 'data' stored in 'SolidMaterialsData' |

## [OpenTEMPEST.Solid.SolidMatBase](OpenTEMPEST_Solid_SolidMatBase.md#opentempestsolidsolidmatbase).BaseProperties

model that calls function for T-dependent k,cp,rho with coefficients in 'data' stored in 'SolidMaterialsData'

### Parameters

| Name | Description |
|----|----|
| kCustom_trans | heat conductivity in transversal direction of layering \[W/(m.K)\] |
| kCustom_long | heat conductivity in longitudinal direction of layering \[W/(m.K)\] |
| cpCustom | heat capacity, J/kg/K \[J/(kg.K)\] |
| rhoCustom | density, kg/m³ \[kg/m3\] |

[Automatically generated](http://www.3ds.com/) Sun Sep 20 19:09:46 2026.
