import FreeCAD
import ImportGui
import FreeCADGui
import os

doc = FreeCAD.newDocument()
ImportGui.insert("hardware/exports/growbeam.step", doc.Name)

FreeCADGui.showMainWindow()
view = FreeCADGui.activeDocument().activeView()
view.viewIsometric()
view.setCameraType("Perspective")
view.zoomToFit()
view.saveImage("hardware/exports/growbeam.png", 1920, 1080, "White")
FreeCAD.closeDocument(doc.Name)
