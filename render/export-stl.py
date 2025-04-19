import FreeCAD, Import
import os
import sys

step_path = os.path.abspath("hardware/exports/growbeam.step")
output_path = os.path.abspath("render/growbeam.stl")

if not os.path.exists(step_path):
    print(f"ERROR: STEP file not found at {step_path}", file=sys.stderr)
    sys.exit(1)

doc = FreeCAD.newDocument()
Import.insert(step_path, doc.Name)

part = doc.Objects[0]
part.Shape.exportStl(output_path)

print(f"✅ Exported STL to {output_path}")
