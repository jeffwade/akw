// Birthday card for eldest, 2020

// Colors
color black, white;
color bgColor, paintColor, textColor;

// Vectors
PVector center;

// Font
PFont font;

// Objects
Brush brush;
ArrayList<Brush> brushes = new ArrayList<Brush>();

// Counters
int clicks;
int dHue;
int currentHue = 180;

void setup() {
  //size(1300, 800);
  fullScreen();
  // colors
  colorMode(HSB, 360, 100, 100);
  black = color(0, 0, 0);
  white = color(0, 0, 100);
  bgColor = white;
  paintColor = color(currentHue,97,96);
  textColor = white;

  // vectors
  center = new PVector(width/2, height/2);

  // Load font
  font = loadFont("snell.vlw");
  textFont(font, 250);

  // Objects
  brush = new Brush(center, paintColor);

  // Counters
  clicks = 0;
  dHue = 11;

  // styling
  background(bgColor);
  fill(textColor);
  noStroke();
}

void draw() {
  paintColor = color(currentHue,97,96);
  
  //change paint color
  if ( mousePressed ) {
    brush.run();
  }

  // blur();

  //write message over the painting
  writeMessage();
}

void mouseReleased() {
  currentHue += dHue;
  currentHue = currentHue%360;
  brush.setColor(paintColor);
  clicks++;
}

void writeMessage() {
  pushStyle();
    fill(textColor);
    text("Happy", 30, 300);
    text("Birthday!", 30, 600);
  popStyle();
}

void blur(){
  pushStyle();
    fill(bgColor, 2);
    rect(0,0,width,height);
  popStyle();
}
