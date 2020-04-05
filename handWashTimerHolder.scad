$fn=96;

difference() {
    translate([31,0,0]) cube([30,90,30],center=true);

    cylinder(r=45,h=32,center=true);

    translate([38,37,0]) cylinder(r=7,h=32,center=true);
    translate([38,-37,0]) cylinder(r=7,h=32,center=true);
}