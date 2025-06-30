inner = [120,100,55];
wall  = 2.4;

module pcb(w,d,h){ color("#4c8") cube([w,d,h]); }
module cutout(x,y,w,d,h=15){ translate([x,y,-1]) cube([w,d,h+2]); }

difference() {
    // outer walls
    cube(inner + [2*wall,2*wall,wall], center=false);
    
    // hollow interior
    translate([wall,wall,wall])
        cube(inner,center=false);
    
    // front vent + USB
    cutout(inner[0]+wall-57, 0, 57,18);
    
    // TFT window (moved to opposite end)
    cutout(0, 60, 30,18,25);  // << moved to left side
    
    // RCA grommet
    translate([-1,15,5])
        rotate([90,0,0])
        cylinder(h=3,d=7.5,$fn=32);
}

// Raspberry Pi 5 (bottom board)
translate([wall+10, wall+10, wall+6])
    pcb(85,56,16);

// Voice Bonnet (stacked)
translate([wall+10, wall+10, wall+22])
    pcb(85,56,10);

// Feather S3 display
translate([0, wall+70, wall+30])
    rotate([0,0,90])
    pcb(22.8,52.5,10);
