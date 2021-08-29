void runSegments(boolean _status) {
  // draw grey background of timeline
  if (!isPlaying) {
    push();
      fill(black, 20);
      noStroke();
      rectMode(CORNERS);
      rect(0, height - barHeight, width, height);
    pop();
  }

  // loop through array of segments
  for ( Segment s : segments) {
    if (isPlaying) {
      s.setHeight(20);
    } else {
       s.setHeight(160);
    }
    s.run(_status);
  }
}

