class Segment {
  float h, w;
  color segColor;
  Timer segTimer;
  int segID;

  Segment(color _c) {
    segColor = _c;
    segID = millis();
    segTimer = new Timer();
  }

  int getID() {
    return segID;
  }
}
