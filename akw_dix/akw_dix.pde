// akw_dix.pde
// A birthday card (2021)

// Global Variables
// ------------------
// Fonts
PFont utility, headline;

//Colors
color black, white, red, orange, yellow, green, teal, blue, violet;

//Vectors
PVector center, cornerUL, cornerUR, cornerBR, cornerBL ;
ArrayList<PVector> corners = new ArrayList<PVector>();
ArrayList<PVector> buttonVectors = new ArrayList<PVector>();

// Controls
Control playControl;
Control resetControl;
ArrayList<PushButton> pushButtons = new ArrayList<PushButton>();

// Global timer
Timer timer;

// Timeline
ArrayList<Segment> segments = new ArrayList<Segment>();

// Booleans
boolean isPlaying = false;

// Values
int barHeight = 160;

void setup() {
  size(900,900);
  init();
}

void draw() {
  background(white);
  // globalTimer(corners.get(0));

  if ( !isPlaying ) {
    runButtons();
    push();
      fill(black, 20);
      noStroke();
      rectMode(CORNERS);
      rect(0, height - barHeight, width, height);
    pop();
  }

  runSegments(isPlaying);
  if ( !segments.isEmpty() ) {
    playControl.run();
    resetControl.run();
  } else {
     showInstructions();
  }
}
