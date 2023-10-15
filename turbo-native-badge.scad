/*
Turbo Native Badge
model by Mike Kasberg
for Joe Masilotti
*/

// Sizes are in mm.
diameter = 50;
thickness = diameter / 10;

radius = diameter / 2;
font_size = diameter / 10;

badge();

// Original size was diameter=1050, which is why some paths below
// are scaled by that.

module badge() {
  // Tallest Parts
  color("#522B23") linear_extrude(thickness) {
    // Outer ring:
    difference() {
      circle(radius, $fn=180);
      circle(0.94 * radius, $fn=180);
    }
    
    // Lightning bolt
    scale([diameter / 1050, diameter / 1050, 1]) translate([-540, -540, 0]) {
      polygon([[860, 860], [380, 540], [490, 540], [220,220], [700, 540], [590, 540], [860, 860]]);
    }
  }

  // Text height parts
  color("#522B23") linear_extrude(0.9 * thickness) {
    // Thin ring
    difference() {
      circle(0.88 * radius, $fn=180);
      circle(0.87 * radius, $fn=180);
    }
    
    dots();
    
    rotate([0, 0, 32]) revolve_text(0.65 * radius, "TURBO", 80);
    rotate([0, 0, -32]) bottom_revolve_text(0.65 * radius, "NATIVE", 80);
    
    
    // Innermost ring
    difference() {
      circle(0.63 * radius, $fn=180);
      circle(0.60 * radius, $fn=180);
    }
    
    side_bars();
  }

  // Inner low part
  cylinder(h=0.5*thickness, r=0.601*radius, $fn=180);

  // Body
  difference() {
    cylinder(h=0.75*thickness, r=0.99*radius, $fn=180);
    translate([0, 0, -0.01]) cylinder(h=thickness, r=0.601*radius, $fn=180);
  }
}

module dot() {
  translate([0, 0.92 * radius, 0]) {
    circle(0.01 * radius);
  }
  translate([-0.01 * radius, 0.9 * radius, 0]) {
    square(0.02 * radius);
  }
  translate([0, 0.9 * radius, 0]) {
    circle(0.01 * radius);
  }
}

module dots() {
  for(i = [0:179]) {
    rotate([0, 0, 2 * i]) {
      dot();
    }
  }
}

module revolve_text(r, chars, deg) {
  PI = 3.14159;
  circumference = 2 * PI * r;
  chars_len = len(chars);
  step_angle = deg / chars_len;
  for(i = [0 : chars_len - 1]) {
    rotate(-i * step_angle) 
      translate([0, r + font_size / 2, 0]) 
        text(
          chars[i], 
          font = "Roboto:style=Black", 
          size = font_size, 
          valign = "center", halign = "center"
        );
  }
}

module bottom_revolve_text(r, chars, deg) {
  PI = 3.14159;
  circumference = 2 * PI * r;
  chars_len = len(chars);
  step_angle = deg / chars_len;
  for(i = [0 : chars_len - 1]) {
    rotate(i * step_angle) 
      translate([0, -(r + font_size / 2), 0]) 
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
    circle(0.78 * radius, $fn=180);
    circle(0.68 * radius, $fn=180);
    scale([diameter / 1050, diameter / 1050, 1]) {
      polygon([[-320, 200], [-260, 500], [260, 500], [320, 200]]);
      polygon([[-320, -200], [-260, -500], [260, -500], [320, -200]]);
    }
  }
}




