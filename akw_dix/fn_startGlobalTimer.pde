void startGlobalTimer(PVector _pos) {
  push();
    textFont(utility);
    fill(0);
    globalTimer.setPosition(_pos);
    globalTimer.run();
  pop();
}

