Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  int MAX_VALUE;
  int MIN_VALUE;
  float x, y;
  float fixedX, fixedY;
  int width;
  int height;
  int bars;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    fixedX = x;
    fixedY = y;
    width = 400;
    height = 200;
    MAX_VALUE = height/2;
    MIN_VALUE = MAX_VALUE*-1;
    bars = (int)random(1,40);
    values = new float[bars];
    speeds = new float[bars];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    x = fixedX;
    y = fixedY;
    fill(255);
    rectMode(CORNERS);
    rect(x, y, x+width, y+height);

    line(x, y+height/2, x+width, y+height/2);

    for (float value: values){
      if (value < -1*height/4){ //if value is negative, it goes up in the compSciPlane
        fill(0,128,0); //green
      } else if (value >= height/4){ //in processing, negative y goes up, positive y goes down
        fill(255,0,0); //red
      } else if (value < 0 && value >= -1*height/4){
        fill(255,255,0); //
      } else if (value >= 0 && value < height/4){
        fill(255,165,0);
      }
      rect(x,y+height/2,x+width/bars,y+height/2+value);
      x+= width/bars;
    }
  }
  
  void update() {
    for (int i = 0; i < values.length; i++) {
      if (values[i] < MIN_VALUE || values[i] > MAX_VALUE){
        speeds[i]*=-1;
      }
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(50, 50);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
