$fn =50;

yA=[$t*10,0,0];
xA=[0,$t*20,0];

y=[10,0,0];
x=[0,10,0];
z=[0,0,10];


/**
/ ASSEMBLY
**/

translate( [0,50,0] ) {
    explode(xA, center=true,enable=true) {
            part1();
            rotate ([180,0,0]) part1();
        }
    explode(yA, center=false,enable=true) {
            part2();
            part3();
            part4();

        }
    }
    
/**
/ Sub-Assemblies
**/    
    
module part1(){
    translate ([0,0,0]) rotate ([90,0,0]) cylinder(5);
    translate ([0,-5,0]) rotate ([90,0,0]) cylinder(r=2,h=2,$fn=6);
}

module part2(){
    difference(){
        cube(10,center=true);
        rotate([90,0,0]) cylinder(r=1.1,h=11,center=true);
    }
}

module part3(){
    translate ([10,0,0]) rotate([0,90,0]) cylinder(10,center=true); 
}

module part4(){
    translate ([15,0,0]) rotate([0,90,0]) cylinder(r1=5,r2=0,h=5);       
}

/**
 /* The Actual Module
  */

module explode( distance, center, enable ) {
    if ( (enable) && (!center) ) {

        
     for ( i= [0:1:$children-1])   // step needed in case $children < 2                
        translate( [i*distance[0],i*distance[1],i*distance[2]] ) {
            children(i);
        } 
    }
    
    //CENTERED
    
    if ( (enable) && (center) ) {
        count = $children - 1;
        explode_start = ( [ (count*distance[0])/2 * -1, (count*distance[1])/2 *-1,(count*distance[2])/2 * -1 ] ) ;
        


        for ( i= [0:1:$children-1])   // step needed in case $children < 2  
        translate( explode_start ) {
            translate( [i*distance[0],i*distance[1],i*distance[2] ] ) {
                children(i);
            }    
        }
    }

    //NOT ENABLED - Include un-altered children

    if (!enable) {        
        for ( i= [0:1:$children-1]){   // step needed in case $children < 2     


            children(i);
        }         
    }
}
