import FreeCAD, Import
import os

# Load STEP file
doc = FreeCAD.newDocument()
Import.insert(os.path.abspath("hardware/exports/growbeam.step"), doc.Name)

# Export as STL
part = doc.Objects[0]
part.Shape.exportStl(os.path.abspath("render/growbeam.stl"))
