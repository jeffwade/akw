class Timer {
  int ID;
  int tIn;
  int tOut;
  int duration = -1;
  boolean isRunning;
  PVector position = new PVector(width/2, height/2);

  Timer() {
    tIn = millis();
    ID = tIn;
    isRunning = true;
  }

  Timer(int _id) {
    ID = _id;
    tIn = millis();
    isRunning = true;
  }

  void run() {
    update();
    display();
  }

  void update() {
    if ( isRunning ) {
      duration = millis() - tIn;
    } else {
       duration = tOut - tIn;
    }

  }

  void display() {
    textFont(utility, 20);
    text(duration, position.x, position.y);
  }

  int getID() {
    return ID;
  }

  void stop(){
    tOut = millis();
    isRunning = false;
  }

  int duration(){
    return tOut - tIn;
  }

  void setPosition(float _x, float _y) {
    position.set(_x, _y);
  }
}
