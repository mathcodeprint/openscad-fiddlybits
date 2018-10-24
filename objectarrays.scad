sphere();

linear_array( count=5, distance=10)  sphere(5);

rectangular_array( rows=5,cols=4,distance=20) cube(5);

translate([-20,0,0]) polar_array ( radius=10, count=15 ) rotate ([180,0,0]) cube(5, center=false);
translate([-20,20,0]) polar_array ( radius=10, count=15 ) cube(5, center=false);
translate([-20,40,0]) polar_array ( radius=10, count=15 ) cube(5, center=true);

translate([-20,60,0]) polar_array ( radius=10, count=7 ) cylinder( 10, center=false, $fn=25 ) ;
translate([-20,80,0]) polar_array ( radius=10, count=7 ) cylinder( 10, center=true, $fn=25 ) ; 

textAndValues();

module linear_array( occurance, distance ) {
    for ( i= [1:1:occurance])  {
        translate([distance*i,0,0,]) 
        children();
    }
}
    
module rectangular_array( rows,cols, distance) {
    for ( i= [0:1:rows-1])  {
        for ( j= [0:1:cols-1]) {
            translate([distance*i,distance*j,0,]) 
            children();
        }
    }
}
    
module polar_array( radius, count, axis ) {
    for ( i= [1:360/count:360])  {
        rotate([0,i,0]) 
        translate([ radius,0,0 ] )
        children();
        
    }
}

module textAndValues(){
     {
     
        color ("blue") linear_extrude(.2) translate([-20,90,0])  text( str("Demo: Don't Print Me"));
        color ("blue") linear_extrude(.2) translate([-20,-20,0]) text( str( "Object Arrays" )  );
        color ("blue") linear_extrude(.2) translate([-20,-40,0]) text( str( "as Operators" )  );
        color ("green") linear_extrude(.2) translate([-20,-60,0]) text( str("@3dprinted4edu"));         
     }
 }
 

 
