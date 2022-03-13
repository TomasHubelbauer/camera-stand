// The main bit the slides in between the top left and top right screws
// holding the monitor to the VESA mount plate
// This can be at least 37 mm tall (Z axis), maybe more, have not tried yet.
translate([0, 0, 20]) cube([98, 4, 17]);

// The bit that sits on the opposite side of the top right screw holding the
// screen to the VESA mount plate (as seen when sitting in front of the screen)
translate([98 + 3, 0, 37 - 4]) cube([4, 4, 4]);

// The bit that sits on the opposite side of the top left screw holding the
// screen to the VESA mount plate (as seen when sitting in front of the screen)
translate([0 - 3 - 4, 0, 37 - 4]) cube([4, 4, 4]);

// The flat bit that connects the boxes that are placed neighboring the top VESA
// mount plate screws - making the whole assembly into sort of a double hook on
// top of the screws
translate([0 - 3 - 4, 0, 37]) cube([4 + 3 + 98 + 3 + 4, 10, 4]);

// The part that is on the opposite side of the mounting plate, a counterpart to
// the main mounting box, which together with the above flat level panel builds
// another hook, this time over the round mounting plate's highest point and not
// over the screws in it
// This must be less than or equal to 74 mm because the mounting plate has flaps
// in it which would prevent sinking this as deep over it otherwise.
// This can also be at most 25 mm tall (Z axis) because if it went deeper than
// that, it would collide with another flap on the mounting plate which has the
// threads the screws connecting the two plate parts screw into.
translate([(98 - 74) / 2, 4 + 2, 20]) cube([74, 4, 17]);
