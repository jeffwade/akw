class Segment {
  float h, w;
  float startX;
  color segColor;
  Timer segTimer;
  int segID;
  boolean isPlaying = false;

  Segment(color _c) {
    segColor = _c;
    segID = segments.size();
    segTimer = new Timer();
    h = barHeight;
    w = width;
  }

  void run (boolean _status) {
    this.isPlaying = _status;
    update();
    display();
  }

  void update() {
    this.segTimer.update();
    int t = this.segTimer.getDuration();
    if ( mousePressed ) {
      // print(t);
    }
    this.startX = this.segID * w;
    // todo:
    // dynamically resize segments based on relative length
  }

  void stopRecording() {
    this.segTimer.stop();
  }

  void display() {
    if ( this.isPlaying ) {
      push();
        background(this.segColor);
      pop();
    } else {
      push();
        rectMode(CORNER);
        fill(this.segColor);
        noStroke();
        rect(this.startX, height - this.h, w, this.h);
      pop();
    }
  }

  int getID() {
    return this.segID;
  }

  int getColor() {
    return this.segColor;
  }


  void setWidth(float _w) {
    this.w = _w;
  }

  @Override
  public String toString() {
    return "Segment ID: " + this.getID() 
      + "; tIN: " + this.segTimer.getIN()
      + "; tOUT: " + this.segTimer.getOUT()
      + "; Duration: " + this.segTimer.getDuration()
      + "; Color: " + this.getColor();
  }
}
