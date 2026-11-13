## [OpenTEMPEST.Examples](OpenTEMPEST_Examples.md#opentempestexamples).Stack

### Package Content

| Name | Description |
|----|----|
| ![OpenTEMPEST.Examples.Stack.Stack0DTest](OpenTEMPEST.Examples.Stack.Stack0DTestS.png) [Stack0DTest](OpenTEMPEST_Examples_Stack.md#opentempestexamplesstackstack0dtest) | Simple example model using the model Stack0D, adiabatic |
| ![OpenTEMPEST.Examples.Stack.Stack1DTest](OpenTEMPEST.Examples.Stack.Stack0DTestS.png) [Stack1DTest](OpenTEMPEST_Examples_Stack.md#opentempestexamplesstackstack1dtest) | Simple example model using the model Stack1D, adiabatic |
| ![OpenTEMPEST.Examples.Stack.SimplifiedStackTest](OpenTEMPEST.Examples.Stack.Stack0DTestS.png) [SimplifiedStackTest](OpenTEMPEST_Examples_Stack.md#opentempestexamplesstacksimplifiedstacktest) | Simple example model using the model blackBoxStack, adiabatic |

## ![OpenTEMPEST.Examples.Stack.Stack0DTest](OpenTEMPEST.Examples.Stack.Stack0DTestI.png) [OpenTEMPEST.Examples.Stack](OpenTEMPEST_Examples_Stack.md#opentempestexamplesstack).Stack0DTest

Simple example model using the model Stack0D, adiabatic

### Information

Extends from Modelica.Icons.Example (Icon for runnable examples).

### Parameters

| Name | Description |
|----|----|
| pStart | \[Pa\] |
| TStart | \[K\] |
| nCells |   |
| nParallel |   |
| ACell | \[m2\] |
| C | Capacity of each stack if nParallel\>=1 \[J/K\] |
| n | Number of axially discretized units in heat ports |
| intermediatePlateDistance | Number of cells between two intermediate plates, set to \>nCells to have none |
| calcPressureDrop | Define in pressure drop calculation is needed |
| useDhtInletOutlet |   |

## ![OpenTEMPEST.Examples.Stack.Stack1DTest](OpenTEMPEST.Examples.Stack.Stack0DTestI.png) [OpenTEMPEST.Examples.Stack](OpenTEMPEST_Examples_Stack.md#opentempestexamplesstack).Stack1DTest

Simple example model using the model Stack1D, adiabatic

### Information

Extends from Modelica.Icons.Example (Icon for runnable examples).

### Parameters

| Name   | Description                                       |
|--------|---------------------------------------------------|
| pStart | \[Pa\]                                            |
| TStart | \[K\]                                             |
| Ncell  |                                                   |
| N      | Number of axially discretized units in heat ports |

## ![OpenTEMPEST.Examples.Stack.SimplifiedStackTest](OpenTEMPEST.Examples.Stack.Stack0DTestI.png) [OpenTEMPEST.Examples.Stack](OpenTEMPEST_Examples_Stack.md#opentempestexamplesstack).SimplifiedStackTest

Simple example model using the model blackBoxStack, adiabatic

### Information

Extends from Modelica.Icons.Example (Icon for runnable examples).

### Parameters

| Name   | Description                                       |
|--------|---------------------------------------------------|
| pStart | \[Pa\]                                            |
| TStart | \[K\]                                             |
| nCells |                                                   |
| n      | Number of axially discretized units in heat ports |

[Automatically generated](http://www.3ds.com/) Sun Sep 20 19:09:45 2026.
