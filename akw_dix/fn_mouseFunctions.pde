void mousePressed() {
  // PUSHBUTTONS
  for ( PushButton b : pushButtons ) {
    if ( b.isMouseInside() && !isPlaying) {
      b.mousePressed();
    }
  }

  // PLAY/STOP
  if ( playControl.isMouseInside() && !segments.isEmpty()) {
    // toggle playing status when you click the play control
    if ( !isPlaying ) {
      // println("play");
      tStart = millis();
      playTimer = new Timer();
      playControl.setLabel("stop");
      // robot.mouseMove(200, 200);
    } else {
      // println("stop");
      playControl.setLabel("play");
      playTimer = null;
      segmentCount = -1;
      headlineCount = -1;
      tNext = 0;
    }
    playControl.toggle();
    resetControl.toggle();
    isPlaying = !isPlaying;
  }

  // RESET
  if ( resetControl.isMouseInside() && !segments.isEmpty() ) {
    // println("reset");
    // toggle playing status when you click the play control
    if ( isPlaying ) {
      isPlaying = !isPlaying;
      playControl.toggle();
      resetControl.toggle();
    }
    segments.clear();
    segmentTimes.clear();
    playControl.setLabel("play");
    tTotal = 0;
    t = -1;
    playTimer = null;
    segmentCount = -1;
    headlineCount = -1;
    tNext = 0;
  }
}

void mouseReleased() {
  for ( PushButton b : pushButtons ) {
    if ( b.isMouseInside() && !isPlaying ) {
      b.mouseReleased();
      Segment s = segments.get(segments.size() - 1);
      int d = s.getDuration();
      tTotal += d;
      segmentTimes.append(d);
      // println(segmentTimes);
    }
  }
}
