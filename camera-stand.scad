// The distance between the right side of the left screw and left side of the
// right screw connecting the VESA mount plate and the screen (as seen when
// sitting in front of the screen)
screws_distance = 96;

// The gap between the back of the screen and the flat side of the VESA mount
// plate facing the screen - the thickness of a support leg that fits there
plate_screen_gap = 4;

// The distance between the top point of the VESA mount plate arc and the top
// side of the left and right top screws connecting the plate and the screen
// (as seen when sitting in front of the screen)
tip_screw_distance = 30;

// The depth between the top point of the VESA mount plate arc and the possible
// flaps that could collide with a box slotted in between the screen and the
// mount plate between the two top screws
// This is the minimum, I have not measured and fit tested for a maximum yet.
tip_pit_depth = 40;

// The diameter of a single screw used to calculate the gap between two parts
// that sit supported on and by the screw when bridged over their tops
screw_diameter = 4;

// The thickness of the VESA mount plate the two rectangular legs sit against
// the sides of
plate_thickness = 2;

// The size of the square columns that sit at the outside of the top left and
// right screws of the VESA mount plate forming a hook together with the main
// rectangle leg and the surface that connects the three legs together to make
// a double hook
square_leg_size = 4;

// The distance from the left side to the right side of the whole leg assembly
// (left leg column, left screw, rectangular leg, right screw, right leg column)
leg_bridge_width = square_leg_size * 2 + screw_diameter * 2 + screws_distance;

// The height of the columnal legs (the distance from the tip of the plate arc,
// the diameter of the screws themselves and a little overhang which I made the
// same size as the footprint of the columns so the overhang is a cube)
square_leg_height = tip_screw_distance + screw_diameter + square_leg_size;

// The height of the rectangular leg that slots between the screen and the VESA
// mount plate and the screws on the plate - the depth into that gap
// This is a bit more that the columnal legs height, but I don't know exactly by
// how much so as `tip_pit_depth` is a minimum and I have not measured maximum.
rectangle_leg_height = tip_pit_depth;

// The rectangular leg that slots in between the screen back and the VESA mount
// plate on one axis and the two top screws on the plate on the other axis
linear_extrude(plate_screen_gap) polygon([
  [0, 0],
  [leg_bridge_width, 0],
  [leg_bridge_width, square_leg_height],
  [leg_bridge_width - square_leg_size, square_leg_height],
  [leg_bridge_width - square_leg_size, square_leg_height - square_leg_size - screw_diameter],
  [leg_bridge_width - square_leg_size - screw_diameter, square_leg_height - square_leg_size - screw_diameter],
  [leg_bridge_width - square_leg_size - screw_diameter, rectangle_leg_height],
  [square_leg_size + screw_diameter, rectangle_leg_height],
  [square_leg_size + screw_diameter, tip_screw_distance],
  [square_leg_size, tip_screw_distance],
  [square_leg_size, square_leg_height],
  [0, square_leg_height],
]);

// The top surface that bridges the gap between the rectangular legs that hug
// the flat sides of the VESA mount plate
translate([0, -plate_screen_gap, 0]) cube([leg_bridge_width, plate_screen_gap, plate_screen_gap + 2 + plate_screen_gap]);

// The other rectangular leg that hugs the flat side of the VESA mount plate
// directed towards the wall as opposed to towards the back of the monitor
translate([(leg_bridge_width - 74) / 2, 0, plate_screen_gap + plate_thickness]) cube([74, plate_screen_gap * 2, plate_screen_gap]);

// TODO: Design the other plate with 74 mm of width between the flaps on the
// other side of the VESA mount plate
