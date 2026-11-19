within OpenTEMPEST.Enumerations;
// Derived in part from ThermoPower (Copyright 2002-2014 Politecnico di Milano, Modelica License 2). See NOTICE.md.
type InitOptions = enumeration(
    noInit "No initial equations",
    fixedState "Initial values of the states are fixed",
    steadyState "Steady-state initialisation",
    steadyStateNoP "Steady-state initialisation except pressures")
  "Initialisation options (replaces ThermoPower.Choices.Init.Options)";
