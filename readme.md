# Camera Stand

![](camera-stand.3mf/Metadata/thumbnail.png)

This repository hosts the development of a 3D model for a 3D printed part that
is used to mount my camera to use as a webcam behind my screen.

I develop the part in OpenSCAD configured to export ASCII STL, slice it using
PrusaSlicer with a script (`./3mf-zip-dir.sh`) to unzip the 3MF project file to
a directory of the same name and print it using a Prusa MK3S 3D printer.

This part sits on top of the VESA mount the monitor is secured to the wall with.
The mount is two-part, one part attached to the wall, the other to the screen
and the latter slides into the former and is secured using screws.

My aim is to design a shape that can sit on top of the VESA mount and produce a
level surface which won't shake or wobble. On top of this surface I will later
recess a shape to fit my camera in.
