void globalTimer(PVector _pos) {
  push();
    textFont(utility);
    fill(0);
    timer.setPosition(_pos);
    timer.run();
  pop();
}

void runSegments(boolean _status) {
  // loop through array of pushButtons
  for ( Segment s : segments) {
    
    if ( segments.size() > 0 ) {
      float _t = s.segTimer.getDuration();
      // float _w = map(_t, )
      s.setWidth(width/segments.size());
    }
    s.run(_status);

  }
}

void runButtons() {
  // loop through array of pushButtons
  for ( int i = 0; i < pushButtons.size(); i++ ) {
    PushButton b = pushButtons.get(i);
    b.run();
  }
}


void showInstructions() {
  push();
    textFont(utility, 20);
    fill(black);
    text("Hold buttons to add color segments.", width/2, height - 90);
  pop();
}
