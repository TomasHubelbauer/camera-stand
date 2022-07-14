# TODO: Consider loading the config from:
# /Users/tomashubelbauer/Library/Application Support/PrusaSlicer
# TODO: Switch to tree supports once PrusaSlicer supports them for FDM (not just SLA)
# https://github.com/prusa3d/PrusaSlicer/issues/1514

# Generate the OpenSCAD ASCII STL to slice by PrusaSlicer in the next steps
/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD camera-stand.scad -o camera-stand.stl

# Generate the OpenSCAD PNG render as PrusaSlicer CLI won't include Metadata/thumbnail.png
https://github.com/prusa3d/PrusaSlicer/issues/7878
/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD camera-stand.scad -o camera-stand.png

# Generate the GCode
# Rotate the model 90 ° to sit on the horizontal surface for support-free print
# Note that config.ini is just the default PrusaSlicer MK3s config
/Applications/Original\ Prusa\ Drivers/PrusaSlicer.app/Contents/MacOS/PrusaSlicer --load config.ini --rotate-x 90 --export-gcode camera-stand.stl --output camera-stand.gcode

# Generate the 3MF PrusaSlicer project
# Rotate the model 90 ° to sit on the horizontal surface for support-free print
# Note that config.ini is just the default PrusaSlicer MK3s config
rm -r camera-stand.3mf
/Applications/Original\ Prusa\ Drivers/PrusaSlicer.app/Contents/MacOS/PrusaSlicer --load config.ini --rotate-x 90 --export-3mf camera-stand.stl --output camera-stand.3mf
mv camera-stand.3mf camera-stand.zip
unzip -d camera-stand.3mf camera-stand.zip
rm camera-stand.zip
