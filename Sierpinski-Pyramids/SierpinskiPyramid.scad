

origin = [0,0,0];
//create a tetrahedron of side length [side] with corner at [or]
module pyramid(or, side){
    s = side;
    v0 = or + [0,0,0];
    v1 = or + [0,s,0];
    v2 = or + [s * sqrt(3)/2,s/2,0];
    v3 = or + [s/(2*sqrt(3)), s/2, s * (sqrt(5)/sqrt(12))];

    polyhedron([v0, v1, v2, v3],[[0,1,2],[0,1,3],[0,2,3],[1,2,3]]);
}

//create a fractal pyramid of total side length [side] with [level] levels of recursion
module sierp(side, level){
    
}

module recurse() {
    scale([1/3,1/3,1/3])children();
}

recurse()pyramid(origin,5);