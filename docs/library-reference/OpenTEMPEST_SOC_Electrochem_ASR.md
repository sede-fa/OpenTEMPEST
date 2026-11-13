## [OpenTEMPEST.SOC.Electrochem](OpenTEMPEST_SOC_Electrochem.md#opentempestsocelectrochem).ASR

### Package Content

| Name                                                                                                                                                                                                       | Description                                                         |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| ---------------------------------------------------------------------|
| ![OpenTEMPEST.SOC.Electrochem.ASR.ASR_log](OpenTEMPEST.SOC.Electrochem.ASR.ASR_logS.png) [ASR_log](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempest-soc-electrochem-asr-asr_log)                             | Logarithmic ASR relationship: ln(ASR/(ohm cm^2)) = A/Tpen - B       |
| ![OpenTEMPEST.SOC.Electrochem.ASR.ASR_Linear](OpenTEMPEST.SOC.Electrochem.ASR.ASR_logS.png) [ASR_Linear](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempest-soc-electrochem-asr-asr_linear)                    | Linear ASR relationship: ASR = A\*Tpen - B                          |
| ![OpenTEMPEST.SOC.Electrochem.ASR.ASR_Exponential](OpenTEMPEST.SOC.Electrochem.ASR.ASR_logS.png) [ASR_Exponential](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempest-soc-electrochem-asr-asr_exponential)     | Exponential ASR relation: ASR/(ohm cm^2) = A\*exp(B\*(Tpen-273.15)) |
| ![OpenTEMPEST.SOC.Electrochem.ASR.ASR_T_Template](OpenTEMPEST.SOC.Electroch72b3c040eb745777plateS.png) [ASR_T_Template](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempest-soc-electrochem-asr-asr_t_template) | Template: see instructions inside                                   |
| ![OpenTEMPEST.SOC.Electrochem.ASR.ASR_Base](OpenTEMPEST.SOC.Electrochem.ASR.ASR_logS.png) [ASR_Base](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempest-soc-electrochem-asr-asr_base)                          | Base Model for ASR objects                                          |
| ![OpenTEMPEST.SOC.Electrochem.ASR.ASR_OhmBase](OpenTEMPEST.SOC.Electrochem.ASR.ASR_logS.png) [ASR_OhmBase](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempest-soc-electrochem-asr-asr_ohmbase)                 | Base Class for Ohmic ASR models                                     |
| ![OpenTEMPEST.SOC.Electrochem.ASR.ASR_Ohm_ESC](OpenTEMPEST.SOC.Electrochem.ASR.ASR_logS.png) [ASR_Ohm_ESC](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempest-soc-electrochem-asr-asr_ohm_esc)                 | Ohmic ASR for ESC - No dimensions                                   |

## ![OpenTEMPEST.SOC.Electrochem.ASR.ASR_log](OpenTEMPEST.SOC.Electrochem.ASR.ASR_logI.png) [OpenTEMPEST.SOC.Electrochem.ASR](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempestsocelectrochemasr).ASR_log

Logarithmic ASR relationship: ln(ASR/(ohm cm^2)) = A/Tpen - B

### Information

Extends from [ASR_Base](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempest-soc-electrochem-asr-asr_base) (Base Model for ASR objects).

### Parameters

| Name | Description |
|------|-------------|
| A    |             |
| B    |             |

## ![OpenTEMPEST.SOC.Electrochem.ASR.ASR_Linear](OpenTEMPEST.SOC.Electrochem.ASR.ASR_logI.png) [OpenTEMPEST.SOC.Electrochem.ASR](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempestsocelectrochemasr).ASR_Linear

Linear ASR relationship: ASR = A\*Tpen - B

### Information

Extends from [ASR_Base](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempest-soc-electrochem-asr-asr_base) (Base Model for ASR objects).

### Parameters

| Name | Description |
|------|-------------|
| A    |             |
| B    |             |

## ![OpenTEMPEST.SOC.Electrochem.ASR.ASR_Exponential](OpenTEMPEST.SOC.Electrochem.ASR.ASR_logI.png) [OpenTEMPEST.SOC.Electrochem.ASR](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempestsocelectrochemasr).ASR_Exponential

Exponential ASR relation: ASR/(ohm cm^2) = A\*exp(B\*(Tpen-273.15))

### Information

Extends from [ASR_Base](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempest-soc-electrochem-asr-asr_base) (Base Model for ASR objects).

### Parameters

| Name | Description |
|------|-------------|
| A    |             |
| B    |             |

## [OpenTEMPEST.SOC.Electrochem.ASR](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempestsocelectrochemasr).ASR_T_Template

Template: see instructions inside

## ![OpenTEMPEST.SOC.Electrochem.ASR.ASR_Base](OpenTEMPEST.SOC.Electrochem.ASR.ASR_logI.png) [OpenTEMPEST.SOC.Electrochem.ASR](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempestsocelectrochemasr).ASR_Base

Base Model for ASR objects

### Parameters

| Name | Description |
|------|-------------|
| A    |             |
| B    |             |

## ![OpenTEMPEST.SOC.Electrochem.ASR.ASR_OhmBase](OpenTEMPEST.SOC.Electrochem.ASR.ASR_logI.png) [OpenTEMPEST.SOC.Electrochem.ASR](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempestsocelectrochemasr).ASR_OhmBase

Base Class for Ohmic ASR models

### Information

Extends from [OpenTEMPEST.SOC.Electrochem.ASR.ASR_Base](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempest-soc-electrochem-asr-asr_base) (Base Model for ASR objects).

### Parameters

| Name | Description |
|------|-------------|
| A    |             |
| B    |             |

## ![OpenTEMPEST.SOC.Electrochem.ASR.ASR_Ohm_ESC](OpenTEMPEST.SOC.Electrochem.ASR.ASR_logI.png) [OpenTEMPEST.SOC.Electrochem.ASR](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempestsocelectrochemasr).ASR_Ohm_ESC

Ohmic ASR for ESC - No dimensions

### Information

DOI: 10.1016/j.ijhydene.2018.12.168

Extends from [OpenTEMPEST.SOC.Electrochem.ASR.ASR_OhmBase](OpenTEMPEST_SOC_Electrochem_ASR.md#opentempest-soc-electrochem-asr-asr_ohmbase) (Base Class for Ohmic ASR models).

### Parameters

| Name | Description   |
|------|---------------|
| A    |               |
| B    |               |
| Yo   | \[Ohm\*cm^2\] |

[Automatically generated](http://www.3ds.com/) Sun Sep 20 19:09:48 2026.
