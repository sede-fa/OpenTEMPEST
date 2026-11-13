## [OpenTEMPEST.SOC.Electrochem](OpenTEMPEST_SOC_Electrochem.md#opentempestsocelectrochem).Components

### Package Content

| Name                                                                                                                                                                                                                                                 | Description                                                                                                                                               |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| -----------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![OpenTEMPEST.SOC.Electrochem.Components.ElectrochemBase](OpenTEMPEST.SOC.Electroch47fe8fdcd2b53324mBaseS.png) [ElectrochemBase](OpenTEMPEST_SOC_Electrochem_Components.md#opentempestsocelectrochemcomponentselectrochembase)                       | Base model for electrochemical models                                                                                                                     |
| ![OpenTEMPEST.SOC.Electrochem.Components.ASR_ElectrochemBase](OpenTEMPEST.SOC.Electroch47fe8fdcd2b53324mBaseS.png) [ASR_ElectrochemBase](OpenTEMPEST_SOC_Electrochem_Components.md#opentempest-soc-electrochem-components-asr_electrochembase)       | Base model for electrochemistry with only ASR approach                                                                                                    |
| ![OpenTEMPEST.SOC.Electrochem.Components.ASR_Steam](OpenTEMPEST.SOC.Electroch47fe8fdcd2b53324mBaseS.png) [ASR_Steam](OpenTEMPEST_SOC_Electrochem_Components.md#opentempest-soc-electrochem-components-asr_steam)                                     |                                                                                                                                                           |
| ![OpenTEMPEST.SOC.Electrochem.Components.BV_ElectrochemBase](OpenTEMPEST.SOC.Electroch47fe8fdcd2b53324mBaseS.png) [BV_ElectrochemBase](OpenTEMPEST_SOC_Electrochem_Components.md#opentempest-soc-electrochem-components-bv_electrochembase)          | Air and Ohmic Overvoltages calculated here. Voltage Balance equation also here. Fuel side overvoltages calculated at level above as well as q_electroChem |
| ![OpenTEMPEST.SOC.Electrochem.Components.BV_Steam](OpenTEMPEST.SOC.Electroch47fe8fdcd2b53324mBaseS.png) [BV_Steam](OpenTEMPEST_SOC_Electrochem_Components.md#opentempest-soc-electrochem-components-bv_steam)                                        | Steam Electrolysis with B-V, Ohmic ASR and Diffusion                                                                                                      |
| ![OpenTEMPEST.SOC.Electrochem.Components.BV_Co](OpenTEMPEST.SOC.Electroch47fe8fdcd2b53324mBaseS.png) [BV_Co](OpenTEMPEST_SOC_Electrochem_Components.md#opentempest-soc-electrochem-components-bv_co)                                                 | Co-Electrolysis with B-V, Ohmic ASR and Diffusion                                                                                                         |
| ![OpenTEMPEST.SOC.Electrochem.Components.BV_CO2](OpenTEMPEST.SOC.Electroch47fe8fdcd2b53324mBaseS.png) [BV_CO2](OpenTEMPEST_SOC_Electrochem_Components.md#opentempest-soc-electrochem-components-bv_co2)                                              | CO2 Electrolysis with B-V, Ohmic ASR and Diffusion                                                                                                        |
| ![OpenTEMPEST.SOC.Electrochem.Components.Crossflow_Electrochem](OpenTEMPEST.SOC.Electroch47fe8fdcd2b53324mBaseS.png) [Crossflow_Electrochem](OpenTEMPEST_SOC_Electrochem_Components.md#opentempest-soc-electrochem-components-crossflow_electrochem) | Crossflow: Steam Electrolysis with B-V, Ohmic ASR and Diffusion. SOEC paper parameters and equations                                                      |

## ![OpenTEMPEST.SOC.Electrochem.Components.ElectrochemBase](OpenTEMPEST.SOC.Electroch47fe8fdcd2b53324mBaseI.png) [OpenTEMPEST.SOC.Electrochem.Components](OpenTEMPEST_SOC_Electrochem_Components.md#opentempestsocelectrochemcomponents).ElectrochemBase

Base model for electrochemical models

### Parameters

| Name                        | Description |
|-----------------------------|-------------|
| replaceable package MediumF |             |
| replaceable package MediumA |             |

### Connectors

| Name                        | Description |
|-----------------------------|-------------|
| replaceable package MediumF |             |
| replaceable package MediumA |             |

## ![OpenTEMPEST.SOC.Electrochem.Components.ASR_ElectrochemBase](OpenTEMPEST.SOC.Electroch47fe8fdcd2b53324mBaseI.png) [OpenTEMPEST.SOC.Electrochem.Components](OpenTEMPEST_SOC_Electrochem_Components.md#opentempestsocelectrochemcomponents).ASR_ElectrochemBase

Base model for electrochemistry with only ASR approach

### Information

Extends from [OpenTEMPEST.SOC.Electrochem.Components.ElectrochemBase](OpenTEMPEST_SOC_Electrochem_Components.md#opentempestsocelectrochemcomponentselectrochembase) (Base model for electrochemical models).

### Parameters

| Name                        | Description |
|-----------------------------|-------------|
| replaceable package MediumF |             |
| replaceable package MediumA |             |
| replaceable model ASRobj    |             |

### Connectors

| Name                     | Description |
|--------------------------|-------------|
| replaceable model ASRobj |             |

## ![OpenTEMPEST.SOC.Electrochem.Components.ASR_Steam](OpenTEMPEST.SOC.Electroch47fe8fdcd2b53324mBaseI.png) [OpenTEMPEST.SOC.Electrochem.Components](OpenTEMPEST_SOC_Electrochem_Components.md#opentempestsocelectrochemcomponents).ASR_Steam

### Information

Extends from [OpenTEMPEST.SOC.Electrochem.Components.ASR_ElectrochemBase](OpenTEMPEST_SOC_Electrochem_Components.md#opentempest-soc-electrochem-components-asr_electrochembase) (Base model for electrochemistry with only ASR approach).

### Parameters

| Name                        | Description |
|-----------------------------|-------------|
| replaceable package MediumF |             |
| replaceable package MediumA |             |
| replaceable model ASRobj    |             |

### Connectors

| Name                     | Description |
|--------------------------|-------------|
| replaceable model ASRobj |             |

## ![OpenTEMPEST.SOC.Electrochem.Components.BV_ElectrochemBase](OpenTEMPEST.SOC.Electroch47fe8fdcd2b53324mBaseI.png) [OpenTEMPEST.SOC.Electrochem.Components](OpenTEMPEST_SOC_Electrochem_Components.md#opentempestsocelectrochemcomponents).BV_ElectrochemBase

Air and Ohmic Overvoltages calculated here. Voltage Balance equation also here. Fuel side overvoltages calculated at level above as well as q_electroChem

### Information

References for parameters:

- DOI: 10.1149/1945-7111/ab6820
- DOI: 10.1149/1945-7111/ad5e01

Extends from [OpenTEMPEST.SOC.Electrochem.Components.ElectrochemBase](OpenTEMPEST_SOC_Electrochem_Components.md#opentempestsocelectrochemcomponentselectrochembase) (Base model for electrochemical models).

### Parameters

| Name                        | Description                                                           |
| -----------------------------| -----------------------------------------------------------------------|
| replaceable package MediumF |                                                                       |
| replaceable package MediumA |                                                                       |
| replaceable model ASRobj    |                                                                       |
| tauFE_Measure               | Measured fuel electrode thickness in m \[m\]                          |
| tauAE_Measure               | Measured air electrode thickness in m \[m\]                           |
| tauEl_Measure               | Measured electrolyte thickness in m \[m\]                             |
| tauFE                       | Fuel electrode thickness in m \[m\]                                   |
| tauAE                       | Air electrode thickness in m \[m\]                                    |
| tauEl                       | Electrolyte thickness in m \[m\]                                      |
| ASROhmDegrationRate         | Degradation rate of the ohmic resitance in Ohm.cm²/kh                 |
| ROhmFac                     | Constant factor for ohmic resistance (e. g. for sensitivity analysis) |
| alphaFE                     | Transfer coefficient for fuel electrode H2/H2O                        |
| alphaAE                     | Transfer coefficient for air electrode                                |
| dpFE                        | Pore diameter of porous fuel electrode \[m\]                          |
| dpAE                        | Pore diameter of porous air electrode \[m\]                           |
| PhsiFE                      | Fitting parameter for fuel electrode - effective tortousity           |
| PhsiAE                      | Fitting parameter for air electrode - effective tortousity            |
| epsiFE                      | Porosity of fuel electrode                                            |
| epsiAE                      | Porosity of air electrode                                             |
| diffusionActive             |                                                                       |
| Xstart\[MediumF.nX\]        |                                                                       |
| E_ae                        | Activation energy air electrode                                       |
| d                           | Exponent for air electrode Jo calculation                             |
| gammaAE                     | Pre-exponential factor                                                |

### Connectors

| Name                     | Description |
|--------------------------|-------------|
| replaceable model ASRobj |             |

## ![OpenTEMPEST.SOC.Electrochem.Components.BV_Steam](OpenTEMPEST.SOC.Electroch47fe8fdcd2b53324mBaseI.png) [OpenTEMPEST.SOC.Electrochem.Components](OpenTEMPEST_SOC_Electrochem_Components.md#opentempestsocelectrochemcomponents).BV_Steam

Steam Electrolysis with B-V, Ohmic ASR and Diffusion

### Information

References for parameters:

- DOI: 10.1149/1945-7111/ad5e01

Extends from [OpenTEMPEST.SOC.Electrochem.Components.BV_ElectrochemBase](OpenTEMPEST_SOC_Electrochem_Components.md#opentempest-soc-electrochem-components-bv_electrochembase) (Air and Ohmic Overvoltages calculated here. Voltage Balance equation also here. Fuel side overvoltages calculated at level above as well as q_electroChem).

### Parameters

| Name                        | Description                                                           |
| -----------------------------| -----------------------------------------------------------------------|
| replaceable package MediumF |                                                                       |
| replaceable package MediumA |                                                                       |
| replaceable model ASRobj    |                                                                       |
| tauFE_Measure               | Measured fuel electrode thickness in m \[m\]                          |
| tauAE_Measure               | Measured air electrode thickness in m \[m\]                           |
| tauEl_Measure               | Measured electrolyte thickness in m \[m\]                             |
| tauFE                       | Fuel electrode thickness in m \[m\]                                   |
| tauAE                       | Air electrode thickness in m \[m\]                                    |
| tauEl                       | Electrolyte thickness in m \[m\]                                      |
| ASROhmDegrationRate         | Degradation rate of the ohmic resitance in Ohm.cm²/kh                 |
| ROhmFac                     | Constant factor for ohmic resistance (e. g. for sensitivity analysis) |
| alphaFE                     | Transfer coefficient for fuel electrode H2/H2O                        |
| alphaAE                     | Transfer coefficient for air electrode                                |
| dpFE                        | Pore diameter of porous fuel electrode \[m\]                          |
| dpAE                        | Pore diameter of porous air electrode \[m\]                           |
| PhsiFE                      | Fitting parameter for fuel electrode - effective tortousity           |
| PhsiAE                      | Fitting parameter for air electrode - effective tortousity            |
| epsiFE                      | Porosity of fuel electrode                                            |
| epsiAE                      | Porosity of air electrode                                             |
| diffusionActive             |                                                                       |
| Xstart\[MediumF.nX\]        |                                                                       |
| E_ae                        | Activation energy air electrode                                       |
| d                           | Exponent for air electrode Jo calculation                             |
| gammaAE                     | Pre-exponential factor                                                |
| E_fe                        | Activation energy fuel electrode                                      |
| a                           |                                                                       |
| b                           |                                                                       |
| gammaFE                     | Pre-exponential factor fuel electrode Jo                              |
| Initialization              |                                                                       |
| UactFE                      | Fuel electrode activation overpotential \[V\]                         |
| UactAE                      | Air electrode activation overpotential \[V\]                          |

## ![OpenTEMPEST.SOC.Electrochem.Components.BV_Co](OpenTEMPEST.SOC.Electroch47fe8fdcd2b53324mBaseI.png) [OpenTEMPEST.SOC.Electrochem.Components](OpenTEMPEST_SOC_Electrochem_Components.md#opentempestsocelectrochemcomponents).BV_Co

Co-Electrolysis with B-V, Ohmic ASR and Diffusion

### Information

References for parameters:

- DOI: 10.1149/1945-7111/ad5e01

Extends from [OpenTEMPEST.SOC.Electrochem.Components.BV_ElectrochemBase](OpenTEMPEST_SOC_Electrochem_Components.md#opentempest-soc-electrochem-components-bv_electrochembase) (Air and Ohmic Overvoltages calculated here. Voltage Balance equation also here. Fuel side overvoltages calculated at level above as well as q_electroChem).

### Parameters

| Name                        | Description                                                           |
| -----------------------------| -----------------------------------------------------------------------|
| replaceable package MediumF |                                                                       |
| replaceable package MediumA |                                                                       |
| replaceable model ASRobj    |                                                                       |
| tauFE_Measure               | Measured fuel electrode thickness in m \[m\]                          |
| tauAE_Measure               | Measured air electrode thickness in m \[m\]                           |
| tauEl_Measure               | Measured electrolyte thickness in m \[m\]                             |
| tauFE                       | Fuel electrode thickness in m \[m\]                                   |
| tauAE                       | Air electrode thickness in m \[m\]                                    |
| tauEl                       | Electrolyte thickness in m \[m\]                                      |
| ASROhmDegrationRate         | Degradation rate of the ohmic resitance in Ohm.cm²/kh                 |
| ROhmFac                     | Constant factor for ohmic resistance (e. g. for sensitivity analysis) |
| alphaFE                     | Transfer coefficient for fuel electrode H2/H2O                        |
| alphaAE                     | Transfer coefficient for air electrode                                |
| dpFE                        | Pore diameter of porous fuel electrode \[m\]                          |
| dpAE                        | Pore diameter of porous air electrode \[m\]                           |
| PhsiFE                      | Fitting parameter for fuel electrode - effective tortousity           |
| PhsiAE                      | Fitting parameter for air electrode - effective tortousity            |
| epsiFE                      | Porosity of fuel electrode                                            |
| epsiAE                      | Porosity of air electrode                                             |
| diffusionActive             |                                                                       |
| Xstart\[MediumF.nX\]        |                                                                       |
| E_ae                        | Activation energy air electrode                                       |
| d                           | Exponent for air electrode Jo calculation                             |
| gammaAE                     | Pre-exponential factor                                                |
| E_fe                        | Activation energy fuel electrode for H2/H2O                           |
| E_fe_C                      | Activation energy fuel electrode for CO/CO2                           |
| a                           |                                                                       |
| b                           |                                                                       |
| a_C                         |                                                                       |
| b_C                         |                                                                       |
| gammaFE                     | Pre-exponential factor fuel electrode H2/H2O Jo                       |
| gammaFE_C                   | Pre-exponential factor fuel electrode CO/CO2 Jo                       |
| Initialization              |                                                                       |
| UactFE                      | Fuel electrode activation overpotential \[V\]                         |
| UactAE                      | Air electrode activation overpotential \[V\]                          |

## ![OpenTEMPEST.SOC.Electrochem.Components.BV_CO2](OpenTEMPEST.SOC.Electroch47fe8fdcd2b53324mBaseI.png) [OpenTEMPEST.SOC.Electrochem.Components](OpenTEMPEST_SOC_Electrochem_Components.md#opentempestsocelectrochemcomponents).BV_CO2

CO2 Electrolysis with B-V, Ohmic ASR and Diffusion

### Information

References for parameters:

- DOI: 10.1149/1945-7111/ad5e01

Extends from [OpenTEMPEST.SOC.Electrochem.Components.BV_ElectrochemBase](OpenTEMPEST_SOC_Electrochem_Components.md#opentempest-soc-electrochem-components-bv_electrochembase) (Air and Ohmic Overvoltages calculated here. Voltage Balance equation also here. Fuel side overvoltages calculated at level above as well as q_electroChem).

### Parameters

| Name                        | Description                                                           |
| -----------------------------| -----------------------------------------------------------------------|
| replaceable package MediumF |                                                                       |
| replaceable package MediumA |                                                                       |
| replaceable model ASRobj    |                                                                       |
| tauFE_Measure               | Measured fuel electrode thickness in m \[m\]                          |
| tauAE_Measure               | Measured air electrode thickness in m \[m\]                           |
| tauEl_Measure               | Measured electrolyte thickness in m \[m\]                             |
| tauFE                       | Fuel electrode thickness in m \[m\]                                   |
| tauAE                       | Air electrode thickness in m \[m\]                                    |
| tauEl                       | Electrolyte thickness in m \[m\]                                      |
| ASROhmDegrationRate         | Degradation rate of the ohmic resitance in Ohm.cm²/kh                 |
| ROhmFac                     | Constant factor for ohmic resistance (e. g. for sensitivity analysis) |
| alphaFE                     | Transfer coefficient for fuel electrode H2/H2O                        |
| alphaAE                     | Transfer coefficient for air electrode                                |
| dpFE                        | Pore diameter of porous fuel electrode \[m\]                          |
| dpAE                        | Pore diameter of porous air electrode \[m\]                           |
| PhsiFE                      | Fitting parameter for fuel electrode - effective tortousity           |
| PhsiAE                      | Fitting parameter for air electrode - effective tortousity            |
| epsiFE                      | Porosity of fuel electrode                                            |
| epsiAE                      | Porosity of air electrode                                             |
| diffusionActive             |                                                                       |
| Xstart\[MediumF.nX\]        |                                                                       |
| E_ae                        | Activation energy air electrode                                       |
| d                           | Exponent for air electrode Jo calculation                             |
| gammaAE                     | Pre-exponential factor                                                |
| E_fe_C                      | Activation energy fuel electrode for CO/CO2                           |
| a_C                         |                                                                       |
| b_C                         |                                                                       |
| gammaFE_C                   | Pre-exponential factor fuel electrode CO/CO2 Jo                       |
| Initialization              |                                                                       |
| UactFE                      | Fuel electrode activation overpotential \[V\]                         |
| UactAE                      | Air electrode activation overpotential \[V\]                          |

## ![OpenTEMPEST.SOC.Electrochem.Components.Crossflow_Electrochem](OpenTEMPEST.SOC.Electroch47fe8fdcd2b53324mBaseI.png) [OpenTEMPEST.SOC.Electrochem.Components](OpenTEMPEST_SOC_Electrochem_Components.md#opentempestsocelectrochemcomponents).Crossflow_Electrochem

Crossflow: Steam Electrolysis with B-V, Ohmic ASR and Diffusion. SOEC paper parameters and equations

### Information

References for parameters:

- DOI: 10.1149/1945-7111/ad5e01

Extends from [OpenTEMPEST.SOC.Electrochem.Components.ElectrochemBase](OpenTEMPEST_SOC_Electrochem_Components.md#opentempestsocelectrochemcomponentselectrochembase) (Base model for electrochemical models).

### Parameters

| Name | Description |
|----|----|
| replaceable package MediumF |   |
| replaceable package MediumA |   |
| replaceable model ASRobj |   |
| tauFE | Fuel electrode thickness \[m\] |
| tauAE | Air electrode thickness \[m\] |
| tauEl | Electrolyte thickness \[m\] |
| dpFE | Pore diameter of porous fuel electrode \[m\] |
| dpAE | Pore diameter of porous air electrode \[m\] |
| PhsiFE | Fitting parameter for fuel electrode - effective tortousity |
| PhsiAE | Fitting parameter for air electrode - effective tortousity |
| epsiFE | Porosity of fuel electrode |
| epsiAE | Porosity of air electrode |
| diffusionActive |   |
| sigma_a | Conductivity of fuel electrode |
| sigma_c | Conductivity of air electrode |
| Kex_fe | Pre-exponential factor for fuel electrode |
| Kex_ae | Pre-exponential factor for air electrode |
| Eex_fe | Fuel electrode activation energy |
| Eex_ae | Air electrode activation energy |

### Connectors

| Name                     | Description |
|--------------------------|-------------|
| replaceable model ASRobj |             |

[Automatically generated](http://www.3ds.com/) Sun Sep 20 19:09:48 2026.
