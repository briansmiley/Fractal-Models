//Reliably renders up to a level 7 carpet in 2d, can extrude to 3d for stl creation but it gets a little slow at level 5 and up. Don't recomment trying to manipulate the view much at all once a large one is rendered

side = 100;


//level of fractal recursion
level = 2;

center = true;

//set extrude to true to render the carpet in 3D with a height of h (otherwise renders a 2d sheet that can be exported to DXF (displays with a false thickness of 1), which is faster and probably what you want)
extrude = true;
h = 2;

//adds a border to the edge of size h; for building overlapping squares with cube_it
border = false;

rend();
//cube_it();



module carpet(){
        s = side + (border ? 2*h:0);
        difference(){
            square(s);
            translate([(border ? h:0),(border ? h:0),0])cuts();
        }
}
module cuts(){
    for (i = [0:level]){
        w = side/pow(3,i);
        for (x = [1.5*w:3*w:side-w], y = [1.5*w:3*w:side-w]) {
          translate([x,y])square(w,center=true);
        }
    }
}

//makes a cube of 6 carpets
module cube_it(){
    disp = ((side+h)/2);
    rotate([90,0,0]){
    translate([0,0,disp])rend();
    translate([0,0,-disp])rend();
    }
    rotate([0,90,0]){
    translate([0,0,disp])rend();
    translate([0,0,-disp])rend();
    }
    translate([0,0,disp])rend();
    translate([0,0,-disp])rend();
    
}


module run(){
    if (extrude) linear_extrude(h, center = true)carpet();
    else carpet();
}


//renders a carpet
module rend(){
    if (center){
        translate([-side/2 - (border ? h:0),-side/2 - (border ? h:0),0])run();
    }
    else{
        run();
    }
}
