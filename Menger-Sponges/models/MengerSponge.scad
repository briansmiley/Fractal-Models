
l = 10;
//Cut Levels (stable up to 4)
T = 1;
difference(){
  cube(l, center = true);
  cutz();
}
module cutz() {
  for (k = [0:T]) {
    w = l/pow(3,k);
    for (x = [(-l/2)+1.5*w:3*w:(l/2)-w], y = [(-l/2)+1.5*w:3*w:(l/2)-w], i = [ [90,0,0], [0,90,0], [0,0,0] ]) {
      rotate(i)translate([x,y,0])cube([w,w,l+1],center=true);
    }
  }
}