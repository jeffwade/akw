class Timer {
  int ID;
  int tIN;
  int tOUT;
  int duration = -1;
  boolean isRunning;
  PVector position = new PVector(width/2, height/2);

  Timer() {
    this.tIN = millis();
    ID = this.tIN;
    isRunning = true;
  }

  Timer(int _id) {
    ID = _id;
    this.tIN = millis();
    isRunning = true;
  }

  void run() {
    update();
    display();
  }

  void update() {
    if ( isRunning ) {
      duration = millis() - this.tIN;
    } else {
       duration = this.tOUT - this.tIN;
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
    this.tOUT = millis();
    isRunning = false;
  }

  int getIN() {
    return this.tIN;
  }

  int getOUT() {
    return this.tOUT;
  }

  int getDuration(){
    return this.tOUT - this.tIN;
  }
  void setPosition(PVector _pos) {
    position =  _pos.copy();
  }

  void setPosition(float _x, float _y) {
    position.set(_x, _y);
  }
}
