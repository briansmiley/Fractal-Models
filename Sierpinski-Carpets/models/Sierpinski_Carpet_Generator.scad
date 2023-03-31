
side = 100;
h = 2;

//level of fractal recursion
level = 5;

//set extrude to true to render the carpet in 3D with a height of h (otherwise renders a 2d sheet that can be exported to DXF (displays with a false thickness of 1), which is faster and probably what you want)
extrude = false;

module carpet(){
        difference(){
        square(side);
        cuts();
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

module run(){
    if (extrude) linear_extrude(h)carpet();
    else carpet();
    }
    
run();