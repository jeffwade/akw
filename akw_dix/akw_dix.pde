// akw_dix.pde
// A birthday card (2021)

// Global Variables
// ------------------
// Fonts
//
// import java.awt.Robot;
// Robot robot = new Robot();
PFont utility, headlineFont;

//Colors
color black, white, red, orange, yellow, green, teal, blue, violet;

// Headlines
String[] headlines = {"Ha", "ppy", "bir", "thda", "y, A", "lex!!", "!"};

//Vectors
PVector center, cornerUL, cornerUR, cornerBR, cornerBL ;
ArrayList<PVector> corners = new ArrayList<PVector>();
ArrayList<PVector> buttonVectors = new ArrayList<PVector>();

// Controls
Control playControl;
Control resetControl;
ArrayList<PushButton> pushButtons = new ArrayList<PushButton>();

// Timers
Timer globalTimer;
Timer playTimer;

// Timeline
ArrayList<Segment> segments = new ArrayList<Segment>();
IntList segmentTimes = new IntList();

// Booleans
boolean isPlaying = false;

// Values
int barHeight = 160;
int t = -1;
int tStart = 0;
int tTotal = 1;
int tNext;
int playtime = 0;
int segmentCount = -1;
int headlineCount = -1;
int modulus = 1;

// APPLICATION
// -----------
void setup() {
  size(900,900);
  // fullScreen();
  init();
}

void draw() {
  background(white);
  // startGlobalTimer(corners.get(0));

  if ( !isPlaying ) {
    runButtons();
    runSegments(isPlaying);
  } else {
     play();
     runSegments(!isPlaying);
     showMarker();
  }

  if ( !segments.isEmpty() ) {
    if ( isPlaying ) {
      if ( mouseY > 100 ) {
      } else {
        playControl.run();
        resetControl.run();
      }
    } else {
      playControl.run();
      resetControl.run();
    }
  } else {
     showInstructions();
  }
  // if(playTimer != null) {
  //   playTimer.setPosition(60, height - 100);
  //   playTimer.run();
  // }
  
}
