//where to place the corner of the triangle
origin = [0,0];

//side length
side = 100;

//recursion level
level = 4;

//rotates and centers the triangle about the origin
center = true;

//choose whether to extrude to a 3d shape
extrude = false;
thickness = 1;

//places a triangle of side length s at point o
module triangle(o, s){
    v0=o;
    v1 = o + [0,s];
    v2 = o + [s*(sqrt(3)/2),s/2];
    polygon([v0, v1, v2]);
}

//creates a recursive sierpinski trianle of level [level] and side length [s]
module sierpinski(level, s){
    if (level == 0) {
        triangle(origin,s);
    }
    else{
        sierpinski(level - 1, s/2);
        translate([0,s/2])sierpinski(level-1,s/2);
        translate([s*sqrt(3)/4,s/4])sierpinski(level-1,s/2);
    }
}

//create a sierpinski triangle of level l, side length s, and centered or not
module create(l,s,cent){
    if(cent){
        rotate([0,0,90])translate([-s/(2*sqrt(3)), -s/2])sierpinski(l,side);
    }
    else{
        sierpinski(l,s);
    }
}

module rend(){
    if (extrude){
        linear_extrude(thickness)create(level, side, center);
    }
    else{
        create(level, side, center);
    }
}

rend();
