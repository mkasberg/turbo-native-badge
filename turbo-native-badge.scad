/*
Turbo Native Badge
model by Mike Kasberg
for Joe Masilotti
*/

thickness = 100;

// Tallest Parts
color("#522B23") linear_extrude(thickness) {
  // Outer ring:
  difference() {
    circle(525);
    circle(495);
  }
  
  // Lightning bolt
  translate([-540, -540, 0]) {
    import("turbo-native-badge.svg", id="bolt-half");
    import("turbo-native-badge.svg", id="bolt-half-2");
  }
}

// Text height parts
color("#522B23") linear_extrude(0.9 * thickness) {
  // Thin ring
  difference() {
    circle(462.5);
    circle(457.5);
  }
  
  dots();
  
  rotate([0, 0, 32]) revolve_text(340, "TURBO", 80);
  rotate([0, 0, -32]) bottom_revolve_text(340, "NATIVE", 80);
  
  
  // Innermost ring
  difference() {
    circle(331);
    circle(319);
  }
  
  side_bars();
}

// Inner low part
cylinder(h=0.5*thickness, r=320);

// Body
difference() {
  cylinder(h=0.75*thickness, r=500);
  translate([0, 0, -0.01]) cylinder(h=thickness, r=320);
}

module dot() {
  translate([0, 480, 0]) {
    circle(5);
  }
  translate([-5, 470, 0]) {
    square(10);
  }
  translate([0, 470, 0]) {
    circle(5);
  }
}

module dots() {
  for(i = [0:179]) {
    rotate([0, 0, 2 * i]) {
      dot();
    }
  }
}

module revolve_text(radius, chars, deg) {
  PI = 3.14159;
  circumference = 2 * PI * radius;
  chars_len = len(chars);
  font_size = 100;
  step_angle = deg / chars_len;
  for(i = [0 : chars_len - 1]) {
    rotate(-i * step_angle) 
      translate([0, radius + font_size / 2, 0]) 
        text(
          chars[i], 
          font = "Roboto:style=Black", 
          size = font_size, 
          valign = "center", halign = "center"
        );
  }
}

module bottom_revolve_text(radius, chars, deg) {
  PI = 3.14159;
  circumference = 2 * PI * radius;
  chars_len = len(chars);
  font_size = 100;
  step_angle = deg / chars_len;
  for(i = [0 : chars_len - 1]) {
    rotate(i * step_angle) 
      translate([0, -(radius + font_size / 2), 0]) 
        text(
          chars[i], 
          font = "Roboto:style=Black", 
          size = font_size, 
          valign = "center", halign = "center"
        );
  }
}

module side_bars() {
  difference() {
    circle(410);
    circle(360);
    polygon([[-320, 200], [-260, 500], [260, 500], [320, 200]]);
    polygon([[-320, -200], [-260, -500], [260, -500], [320, -200]]);
  }
}




