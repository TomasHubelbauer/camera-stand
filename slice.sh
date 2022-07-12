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
