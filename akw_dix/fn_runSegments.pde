void runSegments(boolean _status) {
  // draw grey background of timeline
  push();
    fill(black, 20);
    noStroke();
    rectMode(CORNERS);
    rect(0, height - barHeight, width, height);
  pop();

  // loop through array of segments
  for ( Segment s : segments) {
    s.run(_status);
  }
}

