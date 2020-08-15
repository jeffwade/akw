class Snitch {
  PVector initPos, curPos, targetPos;

  Snitch() {
  initPos = new PVector(600, 250);
  curPos = initPos.copy();
  }

  void run() {
    update();
    display();
  }

  void update() {

  }

  void display() {
    pushMatrix();
      translate(curPos.x, curPos.y);
      scale(0.3);
    pushStyle();
      fill(gold);
      stroke(gold);
      ellipse(0,0,90,90);
      arc(-150, 0, 60, 60, HALF_PI, 3*HALF_PI);
      arc(150, 0, 60, 60, -HALF_PI, HALF_PI);
      line(0, 0, -150, -30);
      line(0, 0, 150, 30);
      //line(600, 250, 450, 200);
      //line(600, 275, 760, 330);
    popStyle(); 
    popMatrix();

  }

  void setTarget(PVector target) {
    targetPos = target.copy();
  }

  void move(float x_, float y_) {
    curPos.x = x_;
    curPos.y = y_;
  }

  boolean checkHit(PVector s) {
    line(curPos.x, curPos.y, s.x, s.y);
    PVector delta = curPos.sub(s);
    if ( delta.mag() < 90 ) {
      return true;
    } else {
       return false;
    }
  }

  boolean checkHit(float x_, float y_) {
    PVector s = new PVector(x_, y_);
    // pushStyle();
    //   stroke(white);
    //   line(curPos.x, curPos.y, s.x, s.y);
    // popStyle();
    float d = curPos.dist(s);
    if ( d < 90 ) {
      return true;
    } else {
       return false;
    }
  }
}
