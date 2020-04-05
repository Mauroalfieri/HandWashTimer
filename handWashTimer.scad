pirDiam=11;
$fn=96;
//batteryHolderBase();
cover();

module cover() {
    difference() {
        translate([0,0,11]) cylinder(r=45,h=12,center=true);
        translate([0,0,10]) cylinder(r=38,h=12,center=true);
        
        translate([0,-38,(pirDiam+4)/2]) cylinder(r=pirDiam/2,h=20,center=true);
            
        // holes
        translate([41*cos(30),-41*sin(30),9]) cylinder(r=1.7,h=10,center=true);
        translate([-41*cos(30),-41*sin(30),9]) cylinder(r=1.7,h=10,center=true);
        translate([0,41,9]) cylinder(r=1.7,h=10,center=true);
        
        for(a=[0:22.5:360]) {
            translate([18.92*cos(a),18.92*sin(a),9]) cylinder(r=1,h=20,center=true);
        }
        
        // power switch
        hull() {
            for(a=[30:5:60]) {
            translate([36*cos(-a),-36*sin(-a),10]) cylinder(r=7,h=12,center=true);
            }
        }
        hull(){
            translate([45*cos(-40),-45*sin(-40),11.5]) rotate([90,0,-45]) cylinder(r=2,h=12,center=true);
            
            translate([45*cos(-50),-45*sin(-50),11.5]) rotate([90,0,-45]) cylinder(r=2,h=12,center=true);
        }
    }
}


module batteryHolderBase() {
    difference() {
        translate([0,0,11]) cylinder(r=45,h=22,center=true);
        
        union() {
            hull() {
                translate([0,-38,(pirDiam+4)/2]) rotate([90,0,0]) cylinder(r=pirDiam/2,h=20,center=true);
                translate([0,-32,25]) rotate([90,0,0]) cylinder(r=(pirDiam/2)+2.5,h=33,center=true);
            }
            
            // holes
            translate([41*cos(30),-41*sin(30),10]) cylinder(r=1.7,h=40,center=true);
            translate([-41*cos(30),-41*sin(30),10]) cylinder(r=1.7,h=40,center=true);
            translate([0,41,10]) cylinder(r=1.7,h=40,center=true);
            
            translate([41*cos(30),-41*sin(30),1.4]) cylinder(r=3,h=5,center=true);
            translate([-41*cos(30),-41*sin(30),2.4]) cylinder(r=3,h=5,center=true);
            translate([0,41,2.4]) cylinder(r=3,h=5,center=true);
            
            
            translate([0,0,pirDiam+10]) NeoPixel();
            translate([0,0,pirDiam+10]) micro();
            translate([0,0,6]) batteryHolder();
        }
    }
}

module NeoPixel() {
	difference() {
		cylinder(r=25,h=3,center=true);
		cylinder(r=15,h=5,center=true);
	}
}

module micro() {
	cylinder(r=12,h=3,center=true);
	translate([0,-14,0]) cube([pirDiam+4,65,3],center=true);
}

module batteryHolder() {
	cube([64,60,20],center=true);
	
	hull() {
		translate([28,26,10]) cube([8,8,20],center=true);
		translate([-28,26,10]) cube([8,8,20],center=true);
	}
}
