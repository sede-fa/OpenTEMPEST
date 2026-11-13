## [OpenTEMPEST](OpenTEMPEST.md#opentempest).Solid

### Package Content

| Name                                                                                                                                                                                 | Description                                                                                                       |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| -------------------------------------------------------------------------------------------------------------------|
| ![OpenTEMPEST.Solid.solidMaterialsRecord](Modelica.Media.IdealGases409308980dd92699StateS.png) [solidMaterialsRecord](OpenTEMPEST_Solid.md#opentempestsolidsolidmaterialsrecord)     | record holding sets of coefficients of selected solid materials for calculating material parameters               |
| ![OpenTEMPEST.Solid.SolidMatBase](OpenTEMPEST.Solid.SolidMatBaseS.png) [SolidMatBase](OpenTEMPEST_Solid_SolidMatBase.md#opentempestsolidsolidmatbase)                                | determines properties of solid material as function of temperature                                                |
| ![OpenTEMPEST.Solid.Material](OpenTEMPEST.Solid.SolidMatBaseS.png) [Material](OpenTEMPEST_Solid_Material.md#opentempestsolidmaterial)                                                |                                                                                                                   |
| ![OpenTEMPEST.Solid.SolidMaterialsData](Modelica.Media.Interfaces.Types.BasicS.png) [SolidMaterialsData](OpenTEMPEST_Solid_SolidMaterialsData.md#opentempestsolidsolidmaterialsdata) | package of solid materials, where each holds coefficients for determining its temperature dependant rho, k and cp |

## ![OpenTEMPEST.Solid.solidMaterialsRecord](OpenTEMPEST.Solid.solidMaterialsRecordI.png) [OpenTEMPEST.Solid](OpenTEMPEST_Solid.md#opentempestsolid).solidMaterialsRecord

record holding sets of coefficients of selected solid materials for calculating material parameters

### Information

This data record contains the coefficients for calculating rho, lambda and cp as a plynomial function of temperature:

The equations have the structure of 3rd order poynomial:

c3\*T^3+ c2\*T^2 + c1\*T +c0

where c0, c1, c2 and c3 are the coefficients and T the temperature.

Extends from Modelica.Icons.Record (Icon for records).

[Automatically generated](http://www.3ds.com/) Sun Sep 20 19:09:46 2026.
