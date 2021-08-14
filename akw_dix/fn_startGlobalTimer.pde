void startGlobalTimer(PVector _pos) {
  push();
    textFont(utility);
    fill(0);
    timer.setPosition(_pos);
    timer.run();
  pop();
}

