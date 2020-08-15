// Birthday card for mom, 2020
color black, white, red, gold, brown;
color bgColor, fgColor;
PVector center;
Broom firebolt;
Snitch snitch;

// Font
PFont font;

int count;

void setup() {
  size(1000, 700);

  // colors
  colorMode(HSB, 360, 100, 100);
  black = color(0, 0, 0);
  white = color(0, 0, 100);
  red = color(0, 97, 80);
  gold = color(50, 70, 96);
  brown = color(30, 20, 40);
  bgColor = red;
  fgColor = white;

  // vectors
  center = new PVector(width/2, height/2);

  // styling
  background(bgColor);
  fill(fgColor);
  stroke(bgColor);
  strokeWeight(3);
 

  // Load font
  font = loadFont("AmericanTypewriter-48.vlw");
  textFont(font, 48);

  // Objects
  firebolt = new Broom(center.x, center.y);
  snitch = new Snitch();

  //variables
  count = 0;
}


void draw() {
  blur();
  firebolt.run();
  if ( count == 0 ) {
    writeMessage(0);
  }
  if ( snitch.checkHit(mouseX, mouseY) ) {
    if ( count < 5 ) {
      snitch.move(random(width), random(height));
      count++;
      writeMessage(1);
    }
    else {
      writeMessage(2);
    }
  }
  snitch.run();
  if ( mousePressed ) {
    count = 0;
  }
}

void writeMessage(int m) {

  pushStyle();
    fill(fgColor);
    if ( m == 0 ) {
      text("Catch the snitch...", 20, 150);
    }
    else if ( m == 1 ) {
      text("Almost!", 20, 350);
    } else {
      text("5,000 points to Hufflepuff!", 20, 150);
      text("Happy Birthday, Mom!", 20, 250);
    }
  popStyle();
}

void blur(){
  pushStyle();
    fill(bgColor,90);
    rect(0,0,width,height);
  popStyle();
}
