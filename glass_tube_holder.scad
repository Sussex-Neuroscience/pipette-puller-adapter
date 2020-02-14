
////////////////////////////////
//   pipete puller adapter    //
// a small 3d printed plate   //
// added to the pipete puller //
// so that is can hold        //
// thinner glass capillaries  //
// CC-BY-SA 4.0 Andre M Chagas//
//  20200214                  // 
////////////////////////////////


//variables
platex = 10;
platey = 10;
platez = 1;

centralHoleD = 2;
sideHoleD = 1;

sideHoleOff = (platey+sideHoleD)/4;

channelD = 0.2;

tolerance = 0.1;

$fn=20;
//code

difference(){
    cube([platex,platey,platez],center=true);
    union(){
        translate([0,0,-1]){
            cylinder(h=platez+2,d=centralHoleD+2*   tolerance);
            }//end translate


        translate([0,sideHoleOff,-1]){
            cylinder(h=platez+2,d=sideHoleD+2*      tolerance);
            }//end translate

        translate([-(platex+2)/2,-sideHoleOff,  platez/2]){
            rotate([0,90,0]){
                cylinder(h=platex+2,d=channelD+2*       tolerance,$fn=3);
            }//end rotate
        }//end translate
    }//end union
}//end difference

