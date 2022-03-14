// The distance between the right side of the left screw and left side of the
// right screw connecting the VESA mount plate and the screen (as seen when
// sitting in front of the screen)
screws_distance = 96;

// The distance between the top sides of the two flaps that presumably have the
// screw holes for the 75x75 mm version of the VESA mount
// This distance is important, because it is the maximum width for something to
// be able to slot between the screws and these flaps in order to go deep into
// the gap between the VESA mount plate and the back of the monitor.
flaps_distance = 74;

// The length of the surface of the flap beneath the screw that needs to be
// accounted for for the main rectangular leg to be narrower by in order to be
// able to slot deep into the gap between the VESA mount plate and the monitor
flap_width = (screws_distance - flaps_distance) / 2;

// The gap between the back of the screen and the flat side of the VESA mount
// plate facing the screen - the thickness of a support leg that fits there
plate_screen_gap = 4;

// The distance between the top point of the VESA mount plate arc and the top
// side of the left and right top screws connecting the plate and the screen
// (as seen when sitting in front of the screen)
tip_screw_distance = 30;

// The distance between the top point of the VESA mount and the top of the flaps
// on the plate that prevent slotting anything below this depth unless it is at
// most as wide as the distance between the flaps.
tip_flap_distance = 36;

// The depth between the top point of the VESA mount plate arc and the possible
// flaps that could collide with a box slotted in between the screen and the
// mount plate between the two top screws
// This is the minimum, I have not measured and fit tested for a maximum yet.
tip_pit_depth = 115;

// The diameter of a single screw used to calculate the gap between two parts
// that sit supported on and by the screw when bridged over their tops
screw_diameter = 3.6;

// The thickness of the VESA mount plate the two rectangular legs sit against
// the sides of
plate_thickness = 1.6;

// The size of the square columns that sit at the outside of the top left and
// right screws of the VESA mount plate forming a hook together with the main
// rectangle leg and the surface that connects the three legs together to make
// a double hook
square_leg_size = 4;

// The distance from the left side to the right side of the whole leg assembly
// (left leg column, left screw, rectangular leg, right screw, right leg column)
leg_bridge_width = square_leg_size * 2 + screw_diameter * 2 + screws_distance;

// The rectangular leg that slots in between the screen back and the VESA mount
// plate on one axis and the two top screws on the plate on the other axis
linear_extrude(plate_screen_gap) polygon([
  // The origin point
  [0, 0],
  // The widest distance covering the length between the side square legs
  [leg_bridge_width, 0],
  // The depth of the first square leg depth with extra to work as a hook
  [leg_bridge_width, tip_pit_depth],
  // The same depth but shifted to the side of the screw to end the hook side
  [leg_bridge_width - square_leg_size, tip_pit_depth],
  // The first point that makes the bridge line over the screw
  [leg_bridge_width - square_leg_size, tip_screw_distance],
  // The second point of the screw bridge line, shifted by screw width
  [leg_bridge_width - square_leg_size - screw_diameter, tip_screw_distance],
  // The surface that sits on the flap close to the screw over the flap's length
  [leg_bridge_width - square_leg_size - screw_diameter, tip_flap_distance],
  // The other side of the flap top surface that doesn't go deeper than this
  [leg_bridge_width - square_leg_size - screw_diameter - flap_width, tip_flap_distance],
  // The first point of the main rectangular leg that slots between the screws and flaps
  [leg_bridge_width - square_leg_size - screw_diameter - flap_width, tip_pit_depth],
  // The second point of the main rectangular leg that goes deep into the plate/screen gap
  [square_leg_size + screw_diameter + flap_width, tip_pit_depth],
  // The first point of the top of the other flap that the rectangular leg is narrower by
  [square_leg_size + screw_diameter + flap_width, tip_flap_distance],
  // The second point of the top surface of the second flap next to the main leg
  [square_leg_size + screw_diameter, tip_flap_distance],
  // The first point over the bridge surface that makes the hook around the second screw
  [square_leg_size + screw_diameter, tip_screw_distance],
  // The second point over the second screw bridge layer, shifted by the screw diameter
  [square_leg_size, tip_screw_distance],
  // The depth of the other columnal square leg that makes a hook around the screw
  [square_leg_size, tip_pit_depth],
  // The other point of the square columnal leg brinding the polygon back to origin
  [0, tip_pit_depth],
]);

// The top surface that bridges the gap between the rectangular legs that hug
// the flat sides of the VESA mount plate
translate([0, -plate_screen_gap, 0]) cube([leg_bridge_width, plate_screen_gap, plate_screen_gap * 2 + plate_thickness]);

// The other rectangular leg that hugs the flat side of the VESA mount plate
// directed towards the wall as opposed to towards the back of the monitor
translate([square_leg_size + screw_diameter + flap_width, 0, plate_screen_gap + plate_thickness]) cube([flaps_distance, 25, plate_screen_gap]);
