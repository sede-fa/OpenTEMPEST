#!/usr/bin/env python3
"""Simulate OpenTEMPEST example models in OpenModelica and report OK/FAIL.

Usage:
  python3 Misc/scripts/check_openmodelica.py [--msl PATH] [--stop T] [Examples.BOP.TestFanSimple ...]

--msl  directory holding Modelica 4.1.0 (the folder that contains Modelica/ and
       ModelicaServices/ and Complex.mo). Omit if MSL 4.1.0 is installed in
       OpenModelica's library path.
With no model names a default set of fast examples is run. TestCrossFlowCell is
slow (~30 min) and only run when named explicitly.
Requires `omc` on PATH. Run output is written to a temporary directory.
"""
import argparse, os, re, subprocess, sys, tempfile

DEFAULT = [
    "Examples.BaseComponents.TestGasFlowPath", "Examples.BaseComponents.TestFlowSplitJoin",
    "Examples.BaseComponents.TestGridLoad", "Examples.BaseComponents.TestWall1D",
    "Examples.BaseComponents.TestSolid1D", "Examples.BOP.TestFanSimple",
    "Examples.BOP.TestCompressor", "Examples.BOP.TestElectricHeater0D",
    "Examples.BOP.TestSimpleGasHeaterVol", "Examples.BOP.TestVaporizer",
    "Examples.BOP.TestEvaporator", "Examples.Stack.Stack0DTest",
    "Examples.Stack.Stack1DTest", "Examples.Stack.SimplifiedStackTest",
]

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--msl"); ap.add_argument("--stop", default="")
    ap.add_argument("models", nargs="*")
    a = ap.parse_args()
    root = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
    lines = []
    if a.msl:
        lines += [f'loadFile("{a.msl}/Modelica/package.mo");',
                  f'loadFile("{a.msl}/ModelicaServices/package.mo");',
                  f'loadFile("{a.msl}/Complex.mo");']
    else:
        lines += ['loadModel(Modelica, {"4.1.0"});']
    lines.append(f'loadFile("{root}/OpenTEMPEST/package.mo");')
    models = a.models or DEFAULT
    for m in models:
        stop = f", stopTime={a.stop}" if a.stop else ""
        lines.append(f'print("=== {m}\\n");r:=simulate(OpenTEMPEST.{m}{stop});'
                     'print(r.messages);print(getErrorString());')
    with tempfile.TemporaryDirectory() as d:
        open(os.path.join(d, "run.mos"), "w").write("\n".join(lines) + "\n")
        out = subprocess.run(["omc", "run.mos"], cwd=d, capture_output=True, text=True).stdout
    bad = 0
    for blk in re.split(r"^=== ", out, flags=re.M)[1:]:
        name = blk.split()[0]
        ok = "simulation finished successfully" in blk
        bad += not ok
        print("OK  " if ok else "FAIL", name)
        if not ok:
            for l in blk.splitlines():
                if re.search(r"Error|assert|[Ff]ailed", l) and "libraries.openmodelica" not in l:
                    print("    ", l[:300])
    sys.exit(1 if bad else 0)

main()
