//Preview function works decently up to level 5 (though it takes a minute); Render function has trouble above level 3

side = 100;
height = 2;
level = 3;

difference(){
    cube([side, side, height]);
    cuts();
}
module cuts(){
    for (i = [1:level]){
        w = side/pow(3,i);
        for (x = [1.5*w:3*w:side-w], y = [1.5*w:3*w:side-w]) {
          translate([x,y,-height])cube([w,w,height*5],center=true);
        }
    }
}