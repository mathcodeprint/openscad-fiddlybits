//!OpenSCAD

rotate_extrude($fn=50){
  difference() {
    translate([10, 0, 0]){
      square([10, 9], center=true);
    }

    translate([15, 0, 0]){
      circle(r=5);
    }
  }
  difference() {
    translate([20, 0, 0]){
      square([10, 9], center=true);
    }

    translate([15, 0, 0]){
      circle(r=5);
    }
  }
}
for (i = [1 : abs(1) : 10]) {
  rotate([0, 0, (i * 36)]){
    translate([15, 0, 0]){
      {
        $fn=50;    //set sides to 50
        sphere(r=4.5);
      }
    }
  }
}
