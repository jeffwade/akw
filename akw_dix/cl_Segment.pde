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
    if ( !this.isPlaying ) {
      float _t = this.getDuration();
      float _w = map(_t, 0, tTotal, 0, width);
      this.setWidth(_w);
      int tBefore = 0;
      for ( int i = 0; i < this.getID(); i++ ) {
        tBefore += segments.get(i).getDuration();
      }
      int _x = (int) map(tBefore, 0, tTotal, 0, width);
      this.setStartPoint(_x);
    }
    

    if ( mousePressed ) {
      // print(t);
    }
    // this.startX = this.segID * w;
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

  int getDuration() {
    return this.segTimer.getDuration();
  }

  float getWidth() {
    return this.w;
  }

  float getStartPoint() {
    return startX;
  }

  void setStartPoint(int _s) {
    this.startX = _s;
  }

  void setWidth(float _w) {
    this.w = _w;
  }

  @Override
  public String toString() {
    return "Segment ID: " + this.getID() 
      + "; tIN: " + this.segTimer.getIN()
      + "; tOUT: " + this.segTimer.getOUT()
      + "; Duration: " + this.getDuration()
      + "; Color: " + this.getColor();
  }
}
