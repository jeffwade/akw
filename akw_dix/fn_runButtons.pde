void runButtons() {
  // loop through array of pushButtons
  for ( int i = 0; i < pushButtons.size(); i++ ) {
    PushButton b = pushButtons.get(i);
    b.run();
  }
}

