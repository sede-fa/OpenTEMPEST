## [OpenTEMPEST.Medium](OpenTEMPEST_Medium.md#opentempestmedium).FlueGas

TEMPEST: Flue Gas

### Information

Extends from Modelica.Media.IdealGases.Common.MixtureGasNasa (Medium model of a mixture of ideal gases based on NASA source).

### Package Content

| Name | Description |
|----|----|
| Inherited |  |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.ThermodynamicState](Modelica.Media.IdealGases409308980dd92699StateS.png) ThermodynamicState | Thermodynamic state variables |
| data={Modelica.Media.IdealGases.Common.SingleGasesData.O2,Modelica.Media.IdealGases.Common.SingleGasesData.Ar,Modelica.Media.IdealGases.Common.SingleGasesData.H2O,Modelica.Media.IdealGases.Common.SingleGasesData.CO2,Modelica.Media.IdealGases.Common.SingleGasesData.N2} | Data records of ideal gas substances |
| excludeEnthalpyOfFormation=false | If true, enthalpy of formation Hf is not included in specific enthalpy h |
| referenceChoice=Modelica.Media.Interfaces.Choices.ReferenceEnthalpy.ZeroAt25C | Choice of reference enthalpy |
| h_offset=0.0 | User defined offset for reference enthalpy, if referenceChoice = UserDefined |
| MMX=data\[:\].MM | Molar masses of components |
| methodForThermalConductivity=1 |   |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.BaseProperties](Modelica.Media.IdealGases39e89d87f9a0fd48rtiesS.png) BaseProperties | Base properties (p, d, T, h, u, R, MM, X, and Xi of NASA mixture gas |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.setState_pTX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) setState_pTX | Return thermodynamic state as function of p, T and composition X |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.setState_phX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) setState_phX | Return thermodynamic state as function of p, h and composition X |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.setState_psX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) setState_psX | Return thermodynamic state as function of p, s and composition X |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.setState_dTX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) setState_dTX | Return thermodynamic state as function of d, T and composition X |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.setSmoothState](OpenTEMPEST.Blocks.Functions.boolToIntS.png) setSmoothState | Return thermodynamic state so that it smoothly approximates: if x \> 0 then state_a else state_b |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.pressure](OpenTEMPEST.Blocks.Functions.boolToIntS.png) pressure | Return pressure of ideal gas |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.temperature](OpenTEMPEST.Blocks.Functions.boolToIntS.png) temperature | Return temperature of ideal gas |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.density](OpenTEMPEST.Blocks.Functions.boolToIntS.png) density | Return density of ideal gas |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.specificEnthalpy](Modelica.Media.IdealGases87a5ce06ff360f8ahalpyS.png) specificEnthalpy | Return specific enthalpy |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.specificInternalEnergy](Modelica.Media.IdealGases87a5ce06ff360f8ahalpyS.png) specificInternalEnergy | Return specific internal energy |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.specificEntropy](OpenTEMPEST.Blocks.Functions.boolToIntS.png) specificEntropy | Return specific entropy |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.specificGibbsEnergy](Modelica.Media.IdealGases87a5ce06ff360f8ahalpyS.png) specificGibbsEnergy | Return specific Gibbs energy |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.specificHelmholtzEnergy](Modelica.Media.IdealGases87a5ce06ff360f8ahalpyS.png) specificHelmholtzEnergy | Return specific Helmholtz energy |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.h_TX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) h_TX | Return specific enthalpy |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.h_TX_der](OpenTEMPEST.Blocks.Functions.boolToIntS.png) h_TX_der | Return specific enthalpy derivative |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.gasConstant](OpenTEMPEST.Blocks.Functions.boolToIntS.png) gasConstant | Return gasConstant |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.specificHeatCapacityCp](OpenTEMPEST.Blocks.Functions.boolToIntS.png) specificHeatCapacityCp | Return specific heat capacity at constant pressure |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.specificHeatCapacityCv](OpenTEMPEST.Blocks.Functions.boolToIntS.png) specificHeatCapacityCv | Return specific heat capacity at constant volume from temperature and gas data |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.MixEntropy](OpenTEMPEST.Blocks.Functions.boolToIntS.png) MixEntropy | Return mixing entropy of ideal gases / R |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.s_TX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) s_TX | Return temperature dependent part of the entropy, expects full entropy vector |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.isentropicExponent](OpenTEMPEST.Blocks.Functions.boolToIntS.png) isentropicExponent | Return isentropic exponent |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.velocityOfSound](Modelica.Media.IdealGases87a5ce06ff360f8ahalpyS.png) velocityOfSound | Return velocity of sound |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.isentropicEnthalpyApproximation](OpenTEMPEST.Blocks.Functions.boolToIntS.png) isentropicEnthalpyApproximation | Approximate method of calculating h_is from upstream properties and downstream pressure |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.isentropicEnthalpy](OpenTEMPEST.Blocks.Functions.boolToIntS.png) isentropicEnthalpy | Return isentropic enthalpy |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.gasMixtureViscosity](OpenTEMPEST.Blocks.Functions.boolToIntS.png) gasMixtureViscosity | Return viscosities of gas mixtures at low pressures (Wilke method) |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.dynamicViscosity](OpenTEMPEST.Blocks.Functions.boolToIntS.png) dynamicViscosity | Return mixture dynamic viscosity |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.mixtureViscosityChung](OpenTEMPEST.Blocks.Functions.boolToIntS.png) mixtureViscosityChung | Return the viscosity of gas mixtures without access to component viscosities (Chung, et. al. rules) |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.lowPressureThermalConductivity](OpenTEMPEST.Blocks.Functions.boolToIntS.png) lowPressureThermalConductivity | Return thermal conductivities of low-pressure gas mixtures (Mason and Saxena Modification) |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.thermalConductivity](OpenTEMPEST.Blocks.Functions.boolToIntS.png) thermalConductivity | Return thermal conductivity for low pressure gas mixtures |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.isobaricExpansionCoefficient](OpenTEMPEST.Blocks.Functions.boolToIntS.png) isobaricExpansionCoefficient | Return isobaric expansion coefficient beta |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.isothermalCompressibility](OpenTEMPEST.Blocks.Functions.boolToIntS.png) isothermalCompressibility | Return isothermal compressibility factor |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.density_derp_T](OpenTEMPEST.Blocks.Functions.boolToIntS.png) density_derp_T | Return density derivative by pressure at constant temperature |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.density_derT_p](OpenTEMPEST.Blocks.Functions.boolToIntS.png) density_derT_p | Return density derivative by temperature at constant pressure |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.density_derX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) density_derX | Return density derivative by mass fraction |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.molarMass](OpenTEMPEST.Blocks.Functions.boolToIntS.png) molarMass | Return molar mass of mixture |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.T_hX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) T_hX | Return temperature from specific enthalpy and mass fraction |
| ![Modelica.Media.IdealGases.Common.MixtureGasNasa.T_psX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) T_psX | Return temperature from pressure, specific entropy and mass fraction |
| fluidConstants={Modelica.Media.IdealGases.Common.FluidData.O2,Modelica.Media.IdealGases.Common.FluidData.Ar,Modelica.Media.IdealGases.Common.FluidData.H2O,Modelica.Media.IdealGases.Common.FluidData.CO2,Modelica.Media.IdealGases.Common.FluidData.N2} | Constant data for the fluid |
| ![Modelica.Media.Interfaces.PartialMixtureMedium.moleToMassFractions](OpenTEMPEST.Blocks.Functions.boolToIntS.png) moleToMassFractions | Return mass fractions X from mole fractions |
| ![Modelica.Media.Interfaces.PartialMixtureMedium.massToMoleFractions](OpenTEMPEST.Blocks.Functions.boolToIntS.png) massToMoleFractions | Return mole fractions from mass fractions X |
| ThermoStates=Modelica.Media.Interfaces.Choices.IndependentVariables.pTX | Enumeration type for independent variables |
| mediumName="FlueGas" | Name of the medium |
| substanceNames={"Oxygen","Argon","Water","Carbondioxide","Nitrogen"} | Names of the mixture substances. Set substanceNames={mediumName} if only one substance. |
| extraPropertiesNames=fill("", 0) | Names of the additional (extra) transported properties. Set extraPropertiesNames=fill("",0) if unused |
| singleState=false | = true, if u and d are not a function of pressure |
| reducedX=false | = true if medium contains the equation sum(X) = 1.0; set reducedX=true if only one substance (see docu for details) |
| fixedX=false | = true if medium contains the equation X = reference_X |
| reference_p=101325 | Reference pressure of Medium: default 1 atmosphere |
| reference_T=298.15 | Reference temperature of Medium: default 25 deg Celsius |
| reference_X={0.23,0.02,0.01,0.04,0.7} | Default mass fractions of medium |
| p_default=101325 | Default value for pressure of medium (for initialization) |
| T_default=Modelica.SIunits.Conversions.from_degC(20) | Default value for temperature of medium (for initialization) |
| h_default=specificEnthalpy_pTX(p_default, T_default, X_default) | Default value for specific enthalpy of medium (for initialization) |
| X_default=reference_X | Default value for mass fractions of medium (for initialization) |
| C_default=fill(0, nC) | Default value for trace substances of medium (for initialization) |
| nS=size(substanceNames, 1) | Number of substances |
| nX=nS | Number of mass fractions |
| nXi=if fixedX then 0 else if reducedX then nS - 1 else nS | Number of structurally independent mass fractions (see docu for details) |
| nC=size(extraPropertiesNames, 1) | Number of extra (outside of standard mass-balance) transported properties |
| C_nominal=1.0e-6\*ones(nC) | Default for the nominal values for the extra properties |
| ![Modelica.Media.Interfaces.PartialMedium.FluidConstants](Modelica.Media.IdealGases409308980dd92699StateS.png) FluidConstants | Critical, triple, molecular and other standard data of fluid |
| ![Modelica.Media.Interfaces.PartialMedium.prandtlNumber](OpenTEMPEST.Blocks.Functions.boolToIntS.png) prandtlNumber | Return the Prandtl number |
| ![Modelica.Media.Interfaces.PartialMedium.heatCapacity_cp](OpenTEMPEST.Blocks.Functions.boolToIntS.png) heatCapacity_cp | Alias for deprecated name |
| ![Modelica.Media.Interfaces.PartialMedium.heatCapacity_cv](OpenTEMPEST.Blocks.Functions.boolToIntS.png) heatCapacity_cv | Alias for deprecated name |
| ![Modelica.Media.Interfaces.PartialMedium.beta](OpenTEMPEST.Blocks.Functions.boolToIntS.png) beta | Alias for isobaricExpansionCoefficient for user convenience |
| ![Modelica.Media.Interfaces.PartialMedium.kappa](OpenTEMPEST.Blocks.Functions.boolToIntS.png) kappa | Alias of isothermalCompressibility for user convenience |
| ![Modelica.Media.Interfaces.PartialMedium.density_derp_h](OpenTEMPEST.Blocks.Functions.boolToIntS.png) density_derp_h | Return density derivative w.r.t. pressure at const specific enthalpy |
| ![Modelica.Media.Interfaces.PartialMedium.density_derh_p](OpenTEMPEST.Blocks.Functions.boolToIntS.png) density_derh_p | Return density derivative w.r.t. specific enthalpy at constant pressure |
| ![Modelica.Media.Interfaces.PartialMedium.specificEnthalpy_pTX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) specificEnthalpy_pTX | Return specific enthalpy from p, T, and X or Xi |
| ![Modelica.Media.Interfaces.PartialMedium.specificEntropy_pTX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) specificEntropy_pTX | Return specific enthalpy from p, T, and X or Xi |
| ![Modelica.Media.Interfaces.PartialMedium.density_pTX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) density_pTX | Return density from p, T, and X or Xi |
| ![Modelica.Media.Interfaces.PartialMedium.temperature_phX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) temperature_phX | Return temperature from p, h, and X or Xi |
| ![Modelica.Media.Interfaces.PartialMedium.density_phX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) density_phX | Return density from p, h, and X or Xi |
| ![Modelica.Media.Interfaces.PartialMedium.temperature_psX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) temperature_psX | Return temperature from p,s, and X or Xi |
| ![Modelica.Media.Interfaces.PartialMedium.density_psX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) density_psX | Return density from p, s, and X or Xi |
| ![Modelica.Media.Interfaces.PartialMedium.specificEnthalpy_psX](OpenTEMPEST.Blocks.Functions.boolToIntS.png) specificEnthalpy_psX | Return specific enthalpy from p, s, and X or Xi |
| ![Modelica.Media.Interfaces.PartialMedium.MassFlowRate](OpenTEMPEST.Examples.ExampleModelS.png) MassFlowRate | Type for mass flow rate with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.AbsolutePressure](OpenTEMPEST.Examples.ExampleModelS.png) AbsolutePressure | Type for absolute pressure with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.Density](OpenTEMPEST.Examples.ExampleModelS.png) Density | Type for density with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.DynamicViscosity](OpenTEMPEST.Examples.ExampleModelS.png) DynamicViscosity | Type for dynamic viscosity with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.EnthalpyFlowRate](OpenTEMPEST.Examples.ExampleModelS.png) EnthalpyFlowRate | Type for enthalpy flow rate with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.MassFraction](OpenTEMPEST.Examples.ExampleModelS.png) MassFraction | Type for mass fraction with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.MoleFraction](OpenTEMPEST.Examples.ExampleModelS.png) MoleFraction | Type for mole fraction with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.MolarMass](OpenTEMPEST.Examples.ExampleModelS.png) MolarMass | Type for molar mass with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.MolarVolume](OpenTEMPEST.Examples.ExampleModelS.png) MolarVolume | Type for molar volume with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.IsentropicExponent](OpenTEMPEST.Examples.ExampleModelS.png) IsentropicExponent | Type for isentropic exponent with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.SpecificEnergy](OpenTEMPEST.Examples.ExampleModelS.png) SpecificEnergy | Type for specific energy with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.SpecificInternalEnergy](OpenTEMPEST.Examples.ExampleModelS.png) SpecificInternalEnergy | Type for specific internal energy with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.SpecificEnthalpy](OpenTEMPEST.Examples.ExampleModelS.png) SpecificEnthalpy | Type for specific enthalpy with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.SpecificEntropy](OpenTEMPEST.Examples.ExampleModelS.png) SpecificEntropy | Type for specific entropy with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.SpecificHeatCapacity](OpenTEMPEST.Examples.ExampleModelS.png) SpecificHeatCapacity | Type for specific heat capacity with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.SurfaceTension](OpenTEMPEST.Examples.ExampleModelS.png) SurfaceTension | Type for surface tension with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.Temperature](OpenTEMPEST.Examples.ExampleModelS.png) Temperature | Type for temperature with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.ThermalConductivity](OpenTEMPEST.Examples.ExampleModelS.png) ThermalConductivity | Type for thermal conductivity with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.PrandtlNumber](OpenTEMPEST.Examples.ExampleModelS.png) PrandtlNumber | Type for Prandtl number with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.VelocityOfSound](OpenTEMPEST.Examples.ExampleModelS.png) VelocityOfSound | Type for velocity of sound with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.ExtraProperty](OpenTEMPEST.Examples.ExampleModelS.png) ExtraProperty | Type for unspecified, mass-specific property transported by flow |
| ![Modelica.Media.Interfaces.Types.CumulativeExtraProperty](OpenTEMPEST.Examples.ExampleModelS.png) CumulativeExtraProperty | Type for conserved integral of unspecified, mass specific property |
| ![Modelica.Media.Interfaces.Types.ExtraPropertyFlowRate](OpenTEMPEST.Examples.ExampleModelS.png) ExtraPropertyFlowRate | Type for flow rate of unspecified, mass-specific property |
| ![Modelica.Media.Interfaces.Types.IsobaricExpansionCoefficient](OpenTEMPEST.Examples.ExampleModelS.png) IsobaricExpansionCoefficient | Type for isobaric expansion coefficient with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.DipoleMoment](OpenTEMPEST.Examples.ExampleModelS.png) DipoleMoment | Type for dipole moment with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.DerDensityByPressure](OpenTEMPEST.Examples.ExampleModelS.png) DerDensityByPressure | Type for partial derivative of density with respect to pressure with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.DerDensityByEnthalpy](OpenTEMPEST.Examples.ExampleModelS.png) DerDensityByEnthalpy | Type for partial derivative of density with respect to enthalpy with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.DerEnthalpyByPressure](OpenTEMPEST.Examples.ExampleModelS.png) DerEnthalpyByPressure | Type for partial derivative of enthalpy with respect to pressure with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.DerDensityByTemperature](OpenTEMPEST.Examples.ExampleModelS.png) DerDensityByTemperature | Type for partial derivative of density with respect to temperature with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.DerTemperatureByPressure](OpenTEMPEST.Examples.ExampleModelS.png) DerTemperatureByPressure | Type for partial derivative of temperature with respect to pressure with medium specific attributes |
| ![Modelica.Media.Interfaces.Types.SaturationProperties](Modelica.Media.IdealGases409308980dd92699StateS.png) SaturationProperties | Saturation properties of two phase medium |
| ![Modelica.Media.Interfaces.Types.FluidLimits](Modelica.Media.IdealGases409308980dd92699StateS.png) FluidLimits | Validity limits for fluid model |
| ![Modelica.Media.Interfaces.Types.FixedPhase](OpenTEMPEST.Examples.ExampleModelS.png) FixedPhase | Phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use |
| ![Modelica.Media.Interfaces.Types.Basic](Modelica.Media.Interfaces.Types.BasicS.png) Basic | The most basic version of a record used in several degrees of detail |
| ![Modelica.Media.Interfaces.Types.IdealGas](Modelica.Media.Interfaces.Types.BasicS.png) IdealGas | The ideal gas version of a record used in several degrees of detail |
| ![Modelica.Media.Interfaces.Types.TwoPhase](Modelica.Media.Interfaces.Types.BasicS.png) TwoPhase | The two phase fluid version of a record used in several degrees of detail |

[Automatically generated](http://www.3ds.com/) Sun Sep 20 19:09:46 2026.
