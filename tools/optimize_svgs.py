import subprocess
import os
from pathlib import Path
import sys
from xml.etree import ElementTree as ET

def remove_white_background(input_path):
    tree = ET.parse(input_path)
    root = tree.getroot()
    viewbox = root.attrib.get("viewBox", "")
    if viewbox:
        _, _, vb_width, vb_height = map(float, viewbox.strip().split())
        def is_background_rect(elem):
            if not elem.tag.endswith("rect"):
                return False
            fill = elem.attrib.get("fill", "").lower()
            if fill not in ["white", "#ffffff", "#fff"]:
                return False
            try:
                x = float(elem.attrib.get("x", 0))
                y = float(elem.attrib.get("y", 0))
                w = float(elem.attrib.get("width", 0))
                h = float(elem.attrib.get("height", 0))
                return (
                    abs(x) < 1e-2 and abs(y) < 1e-2 and
                    abs(w - vb_width) < 1.0 and abs(h - vb_height) < 1.0
                )
            except:
                return False

        to_remove = [e for e in list(root) if is_background_rect(e)]
        for e in to_remove:
            root.remove(e)
        temp_path = input_path.replace(".svg", ".cleaned.svg")
        tree.write(temp_path, encoding='utf-8', xml_declaration=True)
        return temp_path
    return input_path

def crop_svg_with_inkscape(input_path, output_path):
    subprocess.run([
        "inkscape",
        "--export-type=svg",
        "--export-area-drawing",
        f"--export-filename={output_path}",
        input_path
    ], check=True)

def process_svg(input_path, output_path):
    temp = remove_white_background(input_path)
    crop_svg_with_inkscape(temp, output_path)
    if temp != input_path:
        os.remove(temp)


if __name__ == "__main__":
    input_path = Path(sys.argv[1])
    output_path = Path(sys.argv[2])
    process_svg(str(input_path), str(output_path))

