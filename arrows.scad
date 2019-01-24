$fn=50;

size_array = [20,20,15];
position_array = [5,5,5];

mcube( size_array, measure= true, align = "center" );
translate( [0,50,0] ) msphere( 21, measure= true );

module mcube( size, measure ) {
    cube( size );
    arrows( size, measure);
}

module msphere ( size ) {
    if (measure==true ) {
        sphere( r=size/2 );
        diameter( size );
    }  
}

module diameter( thediameter ) {
    // Diameter
    translate ( [thediameter/2,-thediameter/4,0] ) 
        drawArrow( thediameter, "red", [90,0,270]);
}

module arrows( size_array, measure, alignment ) {
 
   if (measure==true ) {
     
     // X- Axis
     translate ( [size_array[0],0,0] ) 
        drawArrow( size_array[0], "red", [90,0,270]);
       
     // Y- Axis
     translate ( [size_array[0],size_array[1],0 ] ) 
        drawArrow( size_array[1], "green", [90,0,0]);
     
     // Z - Axis      
     translate ( [size_array[0],size_array[1],size_array[2]]  ) rotate([180,0,0])
        drawArrow( size_array[2], "blue", [0,0,0]);
     
    }
  }
 module drawArrow( measurement, color, axis ){
     TXT_HEIGHT = 3;
     TEXT_ALIGNMENT_ARRAY = [ measurement ];
     OBJECT_OFFSET = 10;
     
     // I would like ( maybe ) the grey distance indicators to go to the center of the object
     // then offset by the OBJECT_OFFSET Value
     
     rotate( axis ) {  // Rotate to object being measured
     //rotate([90,0,0]){  // Lay on XY Plane
     union(){         
         // The Arrow Parts 
         color ( color ) {
            //Inner Arrow
            translate ([OBJECT_OFFSET,0,0]) cylinder(r1=0,r2=2,h=3);
            //Line
            translate ([OBJECT_OFFSET,0,3]) cylinder(r=.25,h=measurement - 6 );
            //Outer Arrow
            translate ([OBJECT_OFFSET,0,measurement]) rotate([0,180,0]) cylinder(r1=0,r2=2,h=3); 
          }
         
          // The Measurements
            translate ([OBJECT_OFFSET,0,0])
            color ( "black") {
                rotate([0,90,90]) 
                translate([-measurement/2,-TXT_HEIGHT-3,0])
                linear_extrude(.1) text( str( measurement ),TXT_HEIGHT, halign="center" );
            }
         
          // Indicator Lines
            translate ([OBJECT_OFFSET,0,0])
            rotate ( [90,0,-90] ) color( "grey" ) {
                cylinder(r=.25,h=15);
                translate([0,measurement,0])cylinder(r=.25,h=15);
            }
     }
 } // END Rotate to Lay on XY Plane
 } // END Rotate to object being measured
