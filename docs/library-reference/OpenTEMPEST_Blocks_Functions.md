## [OpenTEMPEST.Blocks](OpenTEMPEST_Blocks.md#opentempestblocks).Functions

### Package Content

| Name                                                                                                                                                                                               | Description                                                                                                                                                             |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![OpenTEMPEST.Blocks.Functions.boolToInt](OpenTEMPEST.Blocks.Functions.boolToIntS.png) [boolToInt](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctionsbooltoint)                            | return 1 for true and 0 for false entries                                                                                                                               |
| ![OpenTEMPEST.Blocks.Functions.pressureDropDarcy](OpenTEMPEST.Blocks.Functions.boolToIntS.png) [pressureDropDarcy](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctionspressuredropdarcy)    | Calculates the pressure drop in a porous medium using Darcy's law                                                                                                       |
| ![OpenTEMPEST.Blocks.Functions.simpleWGSEqn](OpenTEMPEST.Blocks.Functions.boolToIntS.png) [simpleWGSEqn](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctionssimplewgseqn)                   |                                                                                                                                                                         |
| ![OpenTEMPEST.Blocks.Functions.g0_T](OpenTEMPEST.Blocks.Functions.boolToIntS.png) [g0_T](OpenTEMPEST_Blocks_Functions.md#opentempest-blocks-functions-g0_t)                                        | Calculating the gibbs energy at given Temperature and Standard pressure of a gas Example: G_h2o = g0_T(T=T, data=Modelica.Media.IdealGases.Common.SingleGasesData.H2O); |
| ![OpenTEMPEST.Blocks.Functions.polySolid](OpenTEMPEST.Blocks.Functions.polySolidS.png) [polySolid](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctionspolysolid)                            | Function to calculate the thermophysical properties of a solid, for a given set of coefficients                                                                         |
| ![OpenTEMPEST.Blocks.Functions.limit](OpenTEMPEST.Blocks.Functions.boolToIntS.png) [limit](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctionslimit)                                        | Limits the input variable between two boundaries                                                                                                                        |
| ![OpenTEMPEST.Blocks.Functions.smoothHeaviside](OpenTEMPEST.Blocks.Functions.polySolidS.png) [smoothHeaviside](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctionssmoothheaviside)          |                                                                                                                                                                         |
| ![OpenTEMPEST.Blocks.Functions.sawToothWave](OpenTEMPEST.Blocks.Functions.polySolidS.png) [sawToothWave](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctionssawtoothwave)                   |                                                                                                                                                                         |
| ![OpenTEMPEST.Blocks.Functions.sinWaveForPulse](OpenTEMPEST.Blocks.Functions.polySolidS.png) [sinWaveForPulse](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctionssinwaveforpulse)          |                                                                                                                                                                         |
| ![OpenTEMPEST.Blocks.Functions.pulseWave](OpenTEMPEST.Blocks.Functions.polySolidS.png) [pulseWave](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctionspulsewave)                            |                                                                                                                                                                         |
| ![OpenTEMPEST.Blocks.Functions.pulseFourierSeries](OpenTEMPEST.Blocks.Functions.polySolidS.png) [pulseFourierSeries](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctionspulsefourierseries) |                                                                                                                                                                         |

## ![OpenTEMPEST.Blocks.Functions.boolToInt](OpenTEMPEST.Blocks.Functions.boolToIntI.png) [OpenTEMPEST.Blocks.Functions](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctions).boolToInt

return 1 for true and 0 for false entries

### Information

Extends from Modelica.Icons.Function (Icon for functions).

### Inputs

| Name         | Description    |
|--------------|----------------|
| boolVec\[:\] | Boolean vector |

### Outputs

| Name                       | Description    |
|----------------------------|----------------|
| intVec\[size(boolVec, 1)\] | integer vector |

## ![OpenTEMPEST.Blocks.Functions.pressureDropDarcy](OpenTEMPEST.Blocks.Functions.boolToIntI.png) [OpenTEMPEST.Blocks.Functions](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctions).pressureDropDarcy

Calculates the pressure drop in a porous medium using Darcy's law

### Information

Extends from Modelica.Icons.Function (Icon for functions).

### Inputs

| Name | Description                                                  |
| ------| --------------------------------------------------------------|
| mf   | Mass flow rate of the fluid \[kg/s\]                         |
| eta  | Dynamic viscosity of the fluid \[Pa.s\]                      |
| rho  | Density of the fluid \[kg/m3\]                               |
| L    | length of flow channel \[m\]                                 |
| A    | Total cross-sectional area of flow channel \[m2\]            |
| k    | Permeability of the porous medium in the flow channel \[m2\] |

### Outputs

| Name | Description          |
| ------| ----------------------|
| dp   | Pressure loss \[Pa\] |

## ![OpenTEMPEST.Blocks.Functions.simpleWGSEqn](OpenTEMPEST.Blocks.Functions.boolToIntI.png) [OpenTEMPEST.Blocks.Functions](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctions).simpleWGSEqn

### Information

Calculated the water gas shift equilibrium (CH4 is consumed).

Extends from Modelica.Icons.Function (Icon for functions).

### Inputs

| Name             | Description            |
| ------------------| ------------------------|
| T                | Temperature            |
| xIn\[Medium.nX\] | Mass composition \[1\] |

### Outputs

| Name             | Description                           |
|------------------|---------------------------------------|
| xEq\[Medium.nX\] | Mass composition in equilibrium \[1\] |

## ![OpenTEMPEST.Blocks.Functions.g0_T](OpenTEMPEST.Blocks.Functions.boolToIntI.png) [OpenTEMPEST.Blocks.Functions](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctions).g0_T

Calculating the gibbs energy at given Temperature and Standard pressure of a gas Example: G_h2o = g0_T(T=T, data=Modelica.Media.IdealGases.Common.SingleGasesData.H2O);

### Information

Extends from Modelica.Icons.Function (Icon for functions).

### Inputs

| Name | Description       |
|------|-------------------|
| data | Ideal gas data    |
| T    | Temperature \[K\] |

### Outputs

| Name | Description |
|------|-------------|
| g    | \[J/kg\]    |

## [OpenTEMPEST.Blocks.Functions](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctions).polySolid

Function to calculate the thermophysical properties of a solid, for a given set of coefficients

### Inputs

| Name   | Description |
| --------| -------------|
| Tref   |             |
| c\[4\] |             |

### Outputs

| Name | Description |
|------|-------------|
| y    |             |

## ![OpenTEMPEST.Blocks.Functions.limit](OpenTEMPEST.Blocks.Functions.boolToIntI.png) [OpenTEMPEST.Blocks.Functions](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctions).limit

Limits the input variable between two boundaries

### Information

This function limits the input variable between two boundaries.

Extends from Modelica.Icons.Function (Icon for functions).

### Inputs

| Name   | Description |
| --------| -------------|
| minVal |             |
| u      |             |
| maxVal |             |

### Outputs

| Name | Description |
|------|-------------|
| y    |             |

## [OpenTEMPEST.Blocks.Functions](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctions).smoothHeaviside

### Inputs

| Name | Description |
|------|-------------|
| u    |             |

### Outputs

| Name | Description |
| ------| -------------|
| y    |             |

## [OpenTEMPEST.Blocks.Functions](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctions).sawToothWave

### Inputs

| Name     | Description |
| ----------| -------------|
| u        |             |
| duration |             |
| duty     |             |

### Outputs

| Name | Description |
|------|-------------|
| y    |             |

## [OpenTEMPEST.Blocks.Functions](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctions).sinWaveForPulse

### Inputs

| Name     | Description |
|----------|-------------|
| u        |             |
| duration |             |
| duty     |             |

### Outputs

| Name | Description |
| ------| -------------|
| y    |             |

## [OpenTEMPEST.Blocks.Functions](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctions).pulseWave

### Inputs

| Name     | Description |
| ----------| -------------|
| u        |             |
| duration |             |
| duty     |             |

### Outputs

| Name | Description |
|------|-------------|
| y    |             |

## [OpenTEMPEST.Blocks.Functions](OpenTEMPEST_Blocks_Functions.md#opentempestblocksfunctions).pulseFourierSeries

### Inputs

| Name      | Description |
| -----------| -------------|
| u         |             |
| frequency |             |
| duty      |             |
| n         |             |
| t         |             |

### Outputs

| Name | Description |
| ------| -------------|
| y    |             |

[Automatically generated](http://www.3ds.com/) Sun Sep 20 19:09:45 2026.
