int symmetry = 5;
int angle = 360 / symmetry;
float strokeSize = 8; // use + and - keys to change instead of slider
float xoff;
// press s to save
// press c to clear

void setup() {
  size(900, 900);
  background(127);
  // colorMode(HSB);
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    save("snowflake.png");
    println("snowflake saved!");
  } else if (key == 'c' || key == 'C') {
    background(127);
  }
}

void draw() {
  translate(width / 2, height / 2);
  
  int mx = mouseX - width / 2;
  int my = mouseY - height / 2;
  int pmx = pmouseX - width / 2;
  int pmy = pmouseY - height / 2;
  
  if (mousePressed) {
    int hu = int(map(sin(radians(xoff)), -1, 1, 0, 255)); //sin(radians(xoff))
    xoff += 20;
    stroke(hu, 100);
    
    for (int i = 0; i < symmetry; i++) {
      rotate(radians(angle));
      
      // float d = dist(mx, my, pmx, pmy);
      // float sw = map(d, 0, 16, 16, 2);
      float sw = strokeSize+abs(sqrt(mx^2+my^2)/sqrt(pmx^2+pmy^2)+.1);
      strokeWeight(sw);
      
      line(mx, my, pmx, pmy);
      
      push();
      scale(1, -1);
      line(mx, my, pmx, pmy);
      pop();
    }
  }
  
  if (keyPressed) {
    if (key == '+' || key == '=') {
      strokeSize = constrain(strokeSize + 0.1, 1, 32);
      println("strokeSize is " + strokeSize);
    } else if (key == '-' || key == '_') {
      strokeSize = constrain(strokeSize - 0.1, 1, 32);
      println("strokeSize is " + strokeSize);
    }
  }
}
