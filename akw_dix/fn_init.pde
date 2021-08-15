void init() {
  // Iniitialize global variables
  // Initialize colors
  colorMode(HSB, 360, 100, 100);
  black = color(0, 0, 0);
  white = color(192, 4, 98);
  color[] bw = {black, white};
  // println("black: " + bw[0]);
  // println("white: " + bw[1]);

  teal = color(172, 100, 96);
  red = color(0, 100, 87);
  orange = color(30, 87, 93);
  yellow = color(60, 87, 93);
  green = color(115, 87, 93);
  blue = color(220, 87, 98);
  violet = color(279, 94, 91);
  color[] colors = {teal, red, orange, yellow, green, blue, violet};
  // println("teal: " + colors[0]);
  // println("red: " + colors[1]);
  // println("orange: " + colors[2]);
  // println("yellow: " + colors[3]);
  // println("green: " + colors[4]);
  // println("blue: " + colors[5]);
  // println("violet: " + colors[6]);

  // Initialize fonts
  // Utility font
  utility = loadFont("Arial.vlw");

  // Display font
  headlineFont = loadFont("Sansita-Black.vlw");
  textAlign(CENTER, CENTER);


  // Initialize vectors
  center = new PVector(width/2, height/2 - 80);
  buttonVectors.add(center);
  // corners
  for ( int i = 0; i < 4; i++ ) {
    int margin = 40;
    float _x, _y;
    switch (i) {
      case 0:
        _x = margin;
        _y = margin;
        break;
      case 1: 
        _x = width - margin;
        _y = margin;
        break;
      case 2:
        _x = width - margin;
        _y = height - margin;
        break;
      case 3:
        _x = margin;
        _y = height - margin;
        break;
      default:
        _x = width/2;
        _y = width/2;
        break;
    }
    corners.add(new PVector(_x, _y));
  }
  // println(corners);
  // add pushButtons at regular angles around the center
  for ( int i = 0; i < colors.length; i++ ) {
    float inc = TWO_PI/(colors.length - 1);
    int r = 220;
    float _x = center.x + r*cos(i*inc - HALF_PI);
    float _y = center.y + r*sin(i*inc - HALF_PI);
    buttonVectors.add(new PVector(_x, _y));
  }
  for ( int i = 0; i < colors.length; i++ ) {
    PVector v = buttonVectors.get(i);
    color c = colors[i];
    pushButtons.add(new PushButton(i, c, v));
  }

  // Initialize timer
  globalTimer = new Timer();

  // Initialize controls
  playControl = new Control("play", new PVector(width - 90, 40));
  resetControl = new Control("reset", new PVector(90, 40));
}
