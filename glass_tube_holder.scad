
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
platex = 50;
platey = 20;
platez = 1;

centralHoleD = 5.5;
sideHoleD = 3.2;

holesDistance = 10;

sideHoleOff = 6.5;//(platey+sideHoleD)/4;

channelD = 0.3;
channelDistance = 3;

//top opening
openingx = 20;
openingy = 6;
openingyD = 20;

//bottom recess
recessy = 4;
recessx = 35;

tolerance = 0.1;


$fn=20;


//code
module holder(){
difference(){
    cube([platex,platey,platez],center=true);
    union(){
        translate([-(platex-recessx)/2,(platey-recessy)/2,0]){
            cube([recessx+0.1,recessy+0.1,platez+1],center=true);
            }//end translate
        translate([((platex-openingx)/2)-openingyD,-(platey-openingy)/2,0]){
            cube([openingx,openingy+0.1,platez+1],center=true);
            }//end translate
    
        translate([(platex+centralHoleD)/2-holesDistance,0,-2]){
            cylinder(h=platez+2,d=centralHoleD+2*   tolerance);
            }//end translate


        translate([(platex+centralHoleD)/2-holesDistance,sideHoleOff,-2]){
            cylinder(h=platez+2,d=sideHoleD+2*      tolerance);
            }//end translate

        translate([-(platex+2)/2,-(platey+channelD)/2+channelDistance,  (platez-channelD)/2+0.05]){
            rotate([0,90,0]){
                cylinder(h=platex+2,d=channelD+2*tolerance,$fn=3);
            }//end rotate
        }//end translate
    }//end union
}//end difference

}//end module

holder();

translate([-60,0,0]){
    mirror([1,0,0]){
        holder();
        }//end mirror
}//end translate
