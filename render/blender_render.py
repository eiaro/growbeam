import bpy
import addon_utils
import os
import mathutils

for addon in addon_utils.modules():
    ver = ''.join([str(v) + '.' for v in addon.bl_info['version']]).rstrip('.') if 'version' in addon.bl_info else None
    print('{name} {ver} {mod}'.format(mod=addon.__name__, name=addon.bl_info['name'], ver=ver))

# Paths
wrl_path = os.path.abspath("hardware/exports/growbeam.wrl")
output_png = os.path.abspath("hardware/exports/growbeam.png")
output_blend = os.path.abspath("render/growbeam.blend")

# Check if file exists
if not os.path.exists(wrl_path):
    raise FileNotFoundError(f"VRML file not found: {wrl_path}")

# Enable the X3D/VRML add-on
try:
    addon_utils.enable("bl_ext.blender_org.web3d_x3d_vrml2_format", default_set=True)
except Exception as e:
    raise RuntimeError(f"Failed to enable bl_ext.blender_org.web3d_x3d_vrml2_format add-on: {e}")

# Clear the scene (optional)
bpy.ops.object.select_all(action='SELECT')
bpy.ops.object.delete()

# Import the VRML file (as X3D)
try:
    bpy.ops.import_scene.x3d(
         filepath=wrl_path,
         axis_forward='Y',
         axis_up='Z',
         )
    print(f"Successfully imported {wrl_path}")
except Exception as e:
    raise RuntimeError(f"Failed to import VRML file: {e}")

# Select all imported objects and join them
imported_objs = bpy.context.selected_objects
if imported_objs:
    bpy.ops.object.select_all(action='DESELECT')
    for obj in imported_objs:
        obj.select_set(True)
    bpy.context.view_layer.objects.active = imported_objs[0]
    bpy.ops.object.join()
    obj = bpy.context.active_object

    # Center object
    bpy.ops.object.origin_set(type='ORIGIN_GEOMETRY', center='BOUNDS')
    bpy.ops.object.transform_apply(location=True, rotation=True, scale=True)
    obj.location = (0, 0, 0)

    # --- Camera framing ---
    # Compute bounding box in world coordinates
    bbox_corners = [obj.matrix_world @ mathutils.Vector(corner) for corner in obj.bound_box]
    min_corner = mathutils.Vector((min([v.x for v in bbox_corners]),
                                   min([v.y for v in bbox_corners]),
                                   min([v.z for v in bbox_corners])))
    max_corner = mathutils.Vector((max([v.x for v in bbox_corners]),
                                   max([v.y for v in bbox_corners]),
                                   max([v.z for v in bbox_corners])))
    center = (min_corner + max_corner) / 2
    size = max((max_corner - min_corner).length, 1)

# Add light
light_data = bpy.data.lights.new(name="Light", type='SUN')
light = bpy.data.objects.new(name="Light", object_data=light_data)
bpy.context.collection.objects.link(light)
light.location = (5, -5, 5)
light.data.energy = 2  # Lower intensity for less white-wash

# Add a ground plane for better contrast
bpy.ops.mesh.primitive_plane_add(size=size*2, location=(center.x, center.y, min_corner.z - 0.01))
plane = bpy.context.active_object
plane_mat = bpy.data.materials.new(name="Ground")
plane_mat.diffuse_color = (0.9, 0.9, 0.9, 1)
plane.data.materials.append(plane_mat)

# Add camera and frame the object
cam_data = bpy.data.cameras.new(name="Camera")
cam = bpy.data.objects.new("Camera", cam_data)
bpy.context.collection.objects.link(cam)
bpy.context.scene.camera = cam

# Place camera so the object fits in view
cam.location = (center.x + size, center.y - size, center.z + size * 0.7)
cam.data.lens = 35
cam.data.type = 'PERSP'
cam.data.clip_end = 1000

# Point camera at the center of the object
direction = center - cam.location
rot_quat = direction.to_track_quat('-Z', 'Y')
cam.rotation_euler = rot_quat.to_euler()

# Render settings
scene = bpy.context.scene
scene.render.engine = 'CYCLES'
scene.render.image_settings.file_format = 'PNG'
scene.render.filepath = output_png
scene.render.resolution_x = 1920
scene.render.resolution_y = 1080

# Add ambient occlusion for depth
scene.cycles.use_ambient_occlusion = True
scene.cycles.ao_factor = 1.0

# Set world background to light gray for contrast
scene.world.use_nodes = True
bg = scene.world.node_tree.nodes["Background"]
bg.inputs[0].default_value = (0.95, 0.95, 0.95, 1)
bg.inputs[1].default_value = 1.0

# Enable denoising for clarity
scene.cycles.use_denoising = True

# Optionally, increase samples for less noise (may slow down render)
scene.cycles.samples = 128

# Render to PNG
bpy.ops.render.render(write_still=True)

# Save Blender scene
bpy.ops.wm.save_as_mainfile(filepath=output_blend)

