import FreeCAD, Import
import os
import sys

step_path = os.path.abspath("hardware/exports/growbeam.step")
output_path = os.path.abspath("render/growbeam.stl")

print(f"🔍 Looking for STEP file at: {step_path}")
if not os.path.exists(step_path):
    print(f"❌ ERROR: STEP file not found!", file=sys.stderr)
    sys.exit(1)

print("📦 Importing STEP file...")
doc = FreeCAD.newDocument()
Import.insert(step_path, doc.Name)

print("🧱 Exporting to STL...")
part = doc.Objects[0]
part.Shape.exportStl(output_path)

print(f"✅ Export complete: {output_path}")
