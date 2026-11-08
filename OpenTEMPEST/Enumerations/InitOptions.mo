within OpenTEMPEST.Enumerations;
type InitOptions = enumeration(
    noInit "No initial equations",
    fixedState "Initial values of the states are fixed",
    steadyState "Steady-state initialisation",
    steadyStateNoP "Steady-state initialisation except pressures")
  "Initialisation options (replaces ThermoPower.Choices.Init.Options)";
