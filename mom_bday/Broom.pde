class Broom {
  PVector curPos, lastPos;
  float angle;

  Broom(float x_, float y_) {
    curPos = new PVector(x_, y_);
    angle = 0;
  }

  void run() {
    update();
    display();
  }

  void update() {
    lastPos = curPos.copy();
    curPos.x = mouseX;
    curPos.y = mouseY;
    if ( lastPos.mag() != curPos.mag() && lastPos.heading() != curPos.heading() ) {
      orient(curPos, lastPos);
    }
  }

  void display() {
    pushMatrix();
      translate(curPos.x, curPos.y);
      rotate(angle);
      scale(0.5);

      pushStyle();
        fill(brown);
        stroke(brown);
        beginShape();
          vertex(-20,0);
          vertex(-20,400);
          vertex(20,400);
          vertex(20,0);
        endShape(CLOSE);
      popStyle();

      pushStyle();
        fill(gold);
        stroke(gold);
        beginShape();
          vertex(-20,400);
          vertex(-70,500);
          vertex(70,500);
          vertex(20,400);
        endShape(CLOSE);

        arc(0, 500 , 140, 140, 0, PI);
      popStyle();
    popMatrix();
  }

  void orient(PVector start, PVector end) {
    PVector delta = end.sub(start);
    angle = -HALF_PI + delta.heading();

  }

  PVector getPosition() {
    return curPos;
  }
}
