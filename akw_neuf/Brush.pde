class Brush {
  PVector initPos, curPos, targetPos;
  color brushColor;
  int points = 70;
  int sizeRange[] = {7, 27};
  int maxDistance = 100;

  Brush(PVector _pos, color _color) {
    initPos = _pos.copy();
    curPos = initPos.copy();
    brushColor = _color;
  }

  void run() {
    update();
    display();
  }

  void update() {
    move(mouseX, mouseY);
  }

  void display() {
    pushMatrix();
      translate(curPos.x, curPos.y);
    pushStyle();
      fill(brushColor);
      for ( int i = 0; i < points; i++ ) {
        float angle = random(TAU);
        float radius = random(maxDistance);
        int size = (int) random(sizeRange[0], sizeRange[1]);
        ellipse(radius*cos(angle), radius*sin(angle), size, size);
      }
    popStyle(); 
    popMatrix();
  }

  void setColor(color _newColor) {
    brushColor = _newColor;
  }

  void setTarget(PVector target) {
    targetPos = target.copy();
  }

  void move(float x_, float y_) {
    curPos.x = x_;
    curPos.y = y_;
  }
}
