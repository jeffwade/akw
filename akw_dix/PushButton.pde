class PushButton {
  PVector btnCenter, btnIn, btnOut;
  int btnHue, btnSaturation, btnValue;
  color btnColor;
  int btnRadius = 50;
  int btnDepth = 2;
  int btnID = -1;
  int currentSegment;

  PushButton() {
    btnCenter = new PVector(width/2, height/2);
    btnIn = new PVector(btnCenter.x + btnDepth, btnCenter.y + btnDepth);
    btnOut = new PVector(btnCenter.x - btnDepth, btnCenter.y - btnDepth);
    btnHue = 172;
    btnSaturation = 100;
    btnValue = 100;
    btnColor = color(btnHue, btnSaturation, btnValue);
    btnRadius = 100;
  }

  PushButton(int _hue, int _sat, int _val, PVector _center) {
    btnCenter = _center.copy();
    btnIn = btnCenter.copy().add(btnDepth, btnDepth);
    btnOut = btnCenter.copy().add(-btnDepth/2, -btnDepth/2);
    btnHue = _hue;
    btnSaturation = _sat;
    btnValue = _val;
    btnColor = color(btnHue, btnSaturation, btnValue);
  }

  PushButton(int _id, color _c, PVector _center) {
    btnCenter = _center.copy();
    btnIn = btnCenter.copy().add(btnDepth, btnDepth);
    btnOut = btnCenter.copy().add(-btnDepth/2, -btnDepth/2);
    btnColor = _c;
    btnHue = (int) hue(btnColor);
    btnSaturation = (int) saturation(btnColor);
    btnValue = (int) brightness(btnColor);
    btnID = _id;
  }

  void run() {
    update();
    display();
  }

  void update() {
    if ( isMouseInside() ) {
      // println("Hit");
    } else {
       // println("Miss");
    }
  }

  void display() {
    drawInnerRing();
    drawButton();
    drawOuterRing();
  }

  void drawButton() {
    float _x = btnOut.x;
    float _y = btnOut.y;
    push();
      colorMode(HSB, 360, 100, 100);
      ellipseMode(RADIUS);
      noStroke();
      if(isMouseInside() && mousePressed){
        fill(btnHue, btnSaturation - 3, btnValue - 8);
        _x = btnIn.x;
        _y = btnIn.y;
      } else {
        fill(btnColor);
      }
        // stroke(150);
        ellipse(_x, _y, btnRadius, btnRadius);
        noStroke();
        // PushButton shadow
        int inOff = 2;
        for ( int i = 1; i < btnRadius - inOff; i++ ) {
          fill(btnHue, btnSaturation - 10, btnValue - 50, 1);
          ellipse(_x + 1, _y + 1, btnRadius - inOff - i, btnRadius - inOff - i);
        }
    pop();
  }

  void drawOuterRing() {
    int ringOffset = 6;
    push();
      ellipseMode(RADIUS);
      colorMode(HSB, 360, 100, 100);
      noFill();
      stroke(btnColor);
      strokeWeight(10);
      ellipse(btnCenter.x, btnCenter.y, btnRadius + ringOffset, btnRadius + ringOffset);
    pop();
  }

  void drawInnerRing() {
    int ringOffset = 2;
    push();
      ellipseMode(RADIUS);
      fill(255/5);
      ellipse(btnCenter.x, btnCenter.y, btnRadius + ringOffset, btnRadius + ringOffset);
    pop();
  }

  boolean isMouseInside() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector _center = btnCenter.copy();
    float d = PVector.dist(mouse, _center);
    if ( d < btnRadius ) {
      return true;
    } else {
       return false;
    }
  }

  void mousePressed() {
    Segment s = new Segment(btnColor);
    segments.add(s);
    currentSegment = s.getID();
  }

  void mouseReleased() {
    int lastSegment = segments.size() - 1;
    segments.get(lastSegment).stopRecording();
    for ( Segment s : segments ) {
      if ( s.getID() == currentSegment ) {
        s.stopRecording();
        // println(s);
      }
    }
  }

    int getID() {
      return btnID;
    }

    int getColor() {
      return btnColor;
    }

}
