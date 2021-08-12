// White screen
// Group of 7 buttons, each a different color
// strip/timeline on bottom of the screen 
// background changes to match the color of the button pressed
// Parts of words appear while a button is pressed
// order of word parts stays the same
// strip on the bottom fills uup with colors based on how long corresponding bbutton is pressed
// Reset button
// Play button
// Stop button

// Fonts
PFont utility, headline;

//Colors
color black, white, red, orange, yellow, green, teal, blue, violet;

//Buttons
PVector center;
ArrayList<PVector> vectors = new ArrayList<PVector>();
ArrayList<Button> buttons = new ArrayList<Button>();

//Timeline
ArrayList<Segment> segments = new ArrayList<Segment>();

//Timer
Timer t;

//Booleans
boolean isPlaying = false;

void setup() {
  size(900,900);
  init();
  t = new Timer();
}

void draw() {
  background(white);

  if ( !isPlaying ) {
    runButtons();
  }

  // runSegments();

  // Global timer
  textFont(utility);
  fill(0);
  t.setPosition(20, 20);
  t.run();

  // if ( isRecording ) {
    //pause show
    //show play button
    //show recording button/indicator
    //
    //show reset button
  // }
}

void init() {
  // Iniitialize colors, fonts, vectors, buttons [to add: play buttons, timeline]
  // Initialize colors
  colorMode(HSB, 360, 100, 100);
  black = color(0, 0, 0);
  white = color(0, 0, 100);

  // color array
  teal = color(172, 100, 96);
  red = color(0, 100, 87);
  orange = color(30, 87, 93);
  yellow = color(60, 87, 93);
  green = color(115, 87, 93);
  blue = color(220, 87, 98);
  violet = color(279, 94, 91);
  color[] colors = {teal, red, orange, yellow, green, blue, violet};

  // Initialize fonts
  // Utility font
  utility = loadFont("Arial.vlw");

  // Display font
  headline = loadFont("Sansita-Black.vlw");

  // Initialize vectors
  center = new PVector(width/2, height/2 - 80);
  vectors.add(center);

  // add buttons at regular angles around the center
  for ( int i = 0; i < colors.length; i++ ) {
    float inc = TWO_PI/(colors.length - 1);
    int r = 220;
    float _x = center.x + r*cos(i*inc - HALF_PI);
    float _y = center.y + r*sin(i*inc - HALF_PI);
    vectors.add(new PVector(_x, _y));
  }
  for ( int i = 0; i < colors.length; i++ ) {
    PVector v = vectors.get(i);
    color c = colors[i];
    buttons.add(new Button(i, c, v));
  }
}

void runSegments(boolean _status) {
  // loop through array of buttons
  for ( Segment s : segments) {
    // s.run(_status);
  }
}

void runButtons() {
  // loop through array of buttons
  for ( int i = 0; i < buttons.size(); i++ ) {
    Button b = buttons.get(i);
    b.run();
  }
}

void mousePressed() {
  for ( Button b : buttons ) {
    if ( b.isMouseInside() ) {
      b.mousePressed();
    }
  }
}

void mouseReleased() {
  for ( Button b : buttons ) {
    if ( b.isMouseInside() ) {
      b.mouseReleased();
    }
  }
}
