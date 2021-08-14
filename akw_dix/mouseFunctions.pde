void mousePressed() {
  for ( PushButton b : pushButtons ) {
    if ( b.isMouseInside() && !isPlaying) {
      b.mousePressed();
    }
  }

  if ( resetControl.isMouseInside() && !segments.isEmpty() ) {
    println("reset");
    // toggle playing status when you click the play control
    if ( isPlaying ) {
      isPlaying = !isPlaying;
      playControl.toggle();
      resetControl.toggle();
    }
    segments.clear();
    playControl.setLabel("play");
  }

  if ( playControl.isMouseInside() && !segments.isEmpty()) {
    // toggle playing status when you click the play control
    isPlaying = !isPlaying;
    if ( !isPlaying ) {
      println("stop");
      playControl.setLabel("play");
    } else {
      println("play");
      playControl.setLabel("stop");
    }
    playControl.toggle();
    resetControl.toggle();
  }
}

void mouseReleased() {
  for ( PushButton b : pushButtons ) {
    if ( b.isMouseInside() && !isPlaying ) {
      b.mouseReleased();
    }
  }
}
