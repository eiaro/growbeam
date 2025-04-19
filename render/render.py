import bpy
import os

# Clean default scene
bpy.ops.wm.read_factory_settings(use_empty=True)

# Import STL
bpy.ops.import_mesh.stl(filepath=os.path.join(os.getcwd(), "render/growbeam.stl"))

# Set up camera
cam_data = bpy.data.cameras.new("Camera")
cam = bpy.data.objects.new("Camera", cam_data)
bpy.context.scene.collection.objects.link(cam)
cam.location = (100, -150, 80)
cam.rotation_euler = (1.1, 0, 0.7)
bpy.context.scene.camera = cam

# Set up light
light_data = bpy.data.lights.new(name="Light", type='SUN')
light = bpy.data.objects.new(name="Light", object_data=light_data)
bpy.context.collection.objects.link(light)
light.location = (50, -100, 150)

# Render settings
bpy.context.scene.render.filepath = os.path.join(os.getcwd(), "render/output.png")
bpy.context.scene.render.image_settings.file_format = 'PNG'

# Render image
bpy.ops.render.render(write_still=True)
