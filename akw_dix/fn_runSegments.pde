void runSegments(boolean _status) {
  push();
    fill(black, 20);
    noStroke();
    rectMode(CORNERS);
    rect(0, height - barHeight, width, height);
  pop();
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

