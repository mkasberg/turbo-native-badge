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
    circle(525, $fn=180);
    circle(495, $fn=180);
  }
  
  // Lightning bolt
  translate([-540, -540, 0]) {
    polygon([[860, 860], [380, 540], [490, 540], [220,220], [700, 540], [590, 540], [860, 860]]);
  }
}

// Text height parts
color("#522B23") linear_extrude(0.9 * thickness) {
  // Thin ring
  difference() {
    circle(462.5, $fn=180);
    circle(457.5, $fn=180);
  }
  
  dots();
  
  rotate([0, 0, 32]) revolve_text(340, "TURBO", 80);
  rotate([0, 0, -32]) bottom_revolve_text(340, "NATIVE", 80);
  
  
  // Innermost ring
  difference() {
    circle(331, $fn=180);
    circle(319, $fn=180);
  }
  
  side_bars();
}

// Inner low part
cylinder(h=0.5*thickness, r=320, $fn=180);

// Body
difference() {
  cylinder(h=0.75*thickness, r=500, $fn=180);
  translate([0, 0, -0.01]) cylinder(h=thickness, r=320, $fn=180);
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
    circle(410, $fn=180);
    circle(360, $fn=180);
    polygon([[-320, 200], [-260, 500], [260, 500], [320, 200]]);
    polygon([[-320, -200], [-260, -500], [260, -500], [320, -200]]);
  }
}




