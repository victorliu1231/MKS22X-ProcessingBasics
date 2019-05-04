int levels;
color bg, fg;

void setup() {
  size(800, 600);
  levels = 1;
}

/*Create Sierpiski's Gasket (google an image of this)
 The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
 levels:
 0 = regular triangle
 1 = triforce (looks like 3 triangles)
 2 = each of the 3 triangles will be cut into 3 triangles.
 etc.
 L represents left vertex
 T is top vertex
 R is right vertex
 */
void gasket(int levels, float Lx, float Ly, float Rx, float Ry, float Tx, float Ty) {
  if (levels == 0){
    return;
  }
  fill(255,0,0);
  triangle(Lx, Ly, Tx, Ty, Rx, Ry);
  fill(255);
  float NewLx = (Lx + Tx)/2;
  float NewLy = (Ly + Ty)/2;
  float NewRx = (Rx + Tx)/2;
  float NewRy = (Ry + Ty)/2;
  float NewTx = (Lx + Rx)/2;
  float NewTy = (Ly + Ry)/2;
  triangle(NewLx, NewLy,
           NewRx, NewRy,
           NewTx, NewTy);
  //left triangle
  gasket(levels-1, Lx, Ly, //left corner stays same
                   NewTx, NewTy, //right corner
                   NewLx, NewLy); //top corner
  //right triangle
  gasket(levels-1, NewTx, NewTy, //left corner
                   Rx, Ry, //right corner stays same
                   NewRx, NewRy); //top corner
  //top triangle
  gasket(levels-1, NewLx, NewLy, //left corner
                   NewRx, NewRy, //right corner
                   Tx, Ty); //top corner stays same
                   
}

void draw() { 
  background(50);  

  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levels", 20, 20);

  gasket(levels, 0, height-10, width, height-10, width/2, 10);

  //koch(levels,width-10, height/2,10, height/3 ); 
  //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked() { 
  levels ++;
}

void keyPressed() {
  levels --;
}
