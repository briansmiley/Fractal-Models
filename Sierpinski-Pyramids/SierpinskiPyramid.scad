

origin = [0,0,0];
side = 100;

//setting printable to true makes the subpyramids overlap very slightly for a contiguous model; doesnt seem to actually enable a full render yet
printable = true;
//corner overlap sets the proportion of side length by which the tips will overlap for printability/contiguousness
corner_overlap = .1;

//choose levels of recursion
level = 1;


//create a tetrahedron of side length [side] with corner at [or]
module pyramid(or, side){
    s = side;
    v0 = or + [0,0,0];
    v1 = or + [0,s,0];
    v2 = or + [s * sqrt(3)/2,s/2,0];
    v3 = or + [s/(2*sqrt(3)), s/2, s * (sqrt(5)/sqrt(12))];

    polyhedron([v0, v1, v2, v3],[[0,2,1],[0,1,3],[0,3,2],[1,2,3]], convexity=10);
}


module sierpinski(level, s) {
    if (level == 0){
        pyramid(origin,s);
    }
    
    else{
        printScale = (printable) ? 1 + corner_overlap :1;
        overscale = [printScale,printScale,printScale];
        
        scale(overscale)sierpinski(level - 1, s/2);
        translate([0,(s/2),0])scale(overscale)sierpinski(level - 1, s/2);
        translate([(s*(sqrt(3)/4)),(s/4),0])scale(overscale)sierpinski(level - 1, s/2);
        translate([(s/(4*sqrt(3))),(s/4), (s * (sqrt(5)/(2*sqrt(12))))])scale(overscale)sierpinski(level - 1, s/2);
    }
}

union()sierpinski(level,side);