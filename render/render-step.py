import FreeCAD
import FreeCADGui
import ImportGui
import os

step_file = os.path.abspath("hardware/exports/growbeam.step")
png_file = os.path.abspath("hardware/exports/growbeam.png")

doc = FreeCAD.newDocument()
ImportGui.insert(step_file, doc.Name)

FreeCADGui.ActiveDocument.ActiveView.viewIsometric()
FreeCADGui.ActiveDocument.ActiveView.setCameraType("Perspective")
FreeCADGui.ActiveDocument.ActiveView.fitAll()

FreeCADGui.ActiveDocument.ActiveView.saveImage(png_file, 1920, 1080, "White")

FreeCAD.closeDocument(doc.Name)
