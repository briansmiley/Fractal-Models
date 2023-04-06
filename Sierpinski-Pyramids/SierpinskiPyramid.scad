

origin = [0,0,0];
side = 100;

//choose levels of recursion
level = 2;

//create a tetrahedron of side length [side] with corner at [or]
module pyramid(or, side){
    s = side;
    v0 = or + [0,0,0];
    v1 = or + [0,s,0];
    v2 = or + [s * sqrt(3)/2,s/2,0];
    v3 = or + [s/(2*sqrt(3)), s/2, s * (sqrt(5)/sqrt(12))];

    polyhedron([v0, v1, v2, v3],[[0,1,2],[0,1,3],[0,2,3],[1,2,3]]);
}


module sierpinski(level, s) {
    if (level == 0){
        pyramid(origin,s);
    }
    
    else{
        sierpinski(level - 1, s/2);
        translate([0,s/2,0])sierpinski(level - 1, s/2);
        translate([s*(sqrt(3)/4),s/4,0])sierpinski(level - 1, s/2);
        translate([s/(4*sqrt(3)),s/4, s * (sqrt(5)/(2*sqrt(12)))])sierpinski(level - 1, s/2);
    }
}

sierpinski(level,side);
