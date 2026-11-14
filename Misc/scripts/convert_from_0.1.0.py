#!/usr/bin/env python3
"""Apply the OpenTEMPEST 0.1.0 -> 0.2.0 class renames to .mo files (no Dymola needed).

Reads the convertClass("old", "new") lines from
OpenTEMPEST/Resources/Scripts/Dymola/ConvertOpenTEMPEST_from_0.1.0.mos, so both stay in sync.

Usage: python3 Misc/scripts/convert_from_0.1.0.py [--dry-run] FILE_OR_DIR ...
Also updates uses(...) of Modelica 3.2.x/ThermoPower in the file when present.
"""
import argparse, os, re, sys

HERE = os.path.dirname(os.path.abspath(__file__))
MOS = os.path.join(HERE, "..", "..", "OpenTEMPEST", "Resources", "Scripts", "Dymola",
                   "ConvertOpenTEMPEST_from_0.1.0.mos")

def rules():
    out = []
    for l in open(MOS):
        m = re.match(r'\s*convertClass\("([^"]+)",\s*"([^"]+)"\)', l)
        if m:
            out.append((re.compile(r"(?<![\w.])" + re.escape(m.group(1)) + r"(?![\w])"), m.group(2)))
    return out

PARAMS = {"HeatSource1DFV": "Nw", "HeatSource1DNonUniformFV": "Nw", "TempSource1DFV": "Nw", "ConvHTFV": "Nv"}

def rename_params(text):
    """Rename Nw/Nv -> N in modifiers of the instances of the models above (0.1.0: Nw/Nv, 0.2.0: N)."""
    for cls, old in PARAMS.items():
        text = re.sub(r"(OpenTEMPEST\.Heat\." + cls + r"\s+\w+\s*\()([^;]*?\))",
                      lambda m: m.group(1) + re.sub(r"\b" + old + r"\b(?=\s*=)", "N", m.group(2)), text)
    return text

def convert(text, rs):
    for rx, new in rs:
        text = rx.sub(new, text)
    text = rename_params(text)
    text = re.sub(r'ThermoPower\(version="[^"]*"\),?\s*', "", text)
    text = re.sub(r'Modelica\(version="3\.2\.\d"\)', 'Modelica(version="4.1.0")', text)
    text = re.sub(r'OpenTEMPEST\(version="0\.1\.\d"\)', 'OpenTEMPEST(version="0.2.0")', text)
    return text

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("paths", nargs="+")
    a = ap.parse_args()
    rs = rules()
    files = []
    for p in a.paths:
        if os.path.isdir(p):
            for d, _, fs in os.walk(p):
                files += [os.path.join(d, f) for f in fs if f.endswith(".mo")]
        else:
            files.append(p)
    for f in files:
        s = open(f, encoding="utf-8").read()
        t = convert(s, rs)
        if t != s:
            print("converted" if not a.dry_run else "would convert", f)
            if not a.dry_run:
                open(f, "w", encoding="utf-8").write(t)

main()
