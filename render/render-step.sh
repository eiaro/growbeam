#!/bin/bash
# Render STEP file to PNG using FreeCAD in headless mode

STEP_FILE="hardware/exports/growbeam.step"
PNG_FILE="hardware/exports/growbeam.png"

echo "Rendering STEP to PNG..."

freecadcmd -c <<EOF
import FreeCAD
import ImportGui
import Part
import MeshPart
import Mesh
import FreeCADGui
import os
import sys

doc = FreeCAD.newDocument()
part = ImportGui.insert(os.path.abspath("${STEP_FILE}"), doc.Name)

FreeCADGui.showMainWindow()
view = FreeCADGui.activeDocument().activeView()
view.viewIsometric()
view.setCameraType("Perspective")
view.zoomToFit()

img_path = os.path.abspath("${PNG_FILE}")
view.saveImage(img_path, 1920, 1080, 'White')
FreeCAD.closeDocument(doc.Name)
EOF

echo "Render complete: ${PNG_FILE}"
