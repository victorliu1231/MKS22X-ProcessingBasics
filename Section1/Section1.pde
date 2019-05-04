int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float fixedX, fixedY;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    fixedX = x;
    fixedY = y;
    values = new float[10];
    speeds = new float[10];
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
    rect(x, y, x+400, y+200);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+100, x+400, y+100);

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    for (float value: values){
      if (value < 0){ //if value is negative, it goes up in the compSciPlane
        fill(0,128,0);
      } else { //in processing, negative y goes up, positive y goes down
        fill(255,0,0);
      }
      rect(x,y+100,x+400/10,y+100+value);
      x+= 400/10;
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
  v = new Visualizer(20, 20);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
