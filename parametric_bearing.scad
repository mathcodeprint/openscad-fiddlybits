$fn=50;

outer_radius = 22;
bore_radius = 8;

shoulder_radius_inner = 13;
shoulder_radius_outer = 17;

raceway_radius = 15;
cutout_radius = 3.5;
ballsize_raduis = 3.25;

width = 7;

parametric_measures();

translate ([0,0,30]) fixed_measures();

//// With Parameters

module parametric_measures(){
rotate_extrude(){

    difference(){
        union(){
            translate([10.5,0,0]) square([5,width], center = true);
            translate([19.5,0,0]) square([5,width], center = true);
        }
        translate([ 14.75,0,0]) circle( 3.5 ,$fn=50) ;
    }
}

for ( ball = [0 : 30 : 360] ) {
    rotate([0,0,ball])
    translate([14.75,0,0])
    sphere( r=3.25 ) ;
   
}

}


//// Without Parameters

module fixed_measures(){
rotate_extrude(){

    difference(){
        union(){
            translate([10.5,0,0]) square([5,7], center = true);
            translate([19.5,0,0]) square([5,7], center = true);
        }
        translate([ 14.75,0,0]) circle( 3.5 ,$fn=50) ;
    }
}

for ( ball = [0 : 30 : 360] ) {
    rotate([0,0,ball])
    translate([14.75,0,0])
    sphere( r=3.25 ) ;
   
}

}