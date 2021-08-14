class Control {
  String label;
  int w, h;
  boolean isPlaying = false;
  PVector position;
  int radius = 24;
  color bgColor = black;
  color iconColor = white;

  Control() {
    this.position = new PVector(width/2, height/2);
  }

  Control(PVector _pos) {
    this.position = _pos.copy();
  }

  Control(String _s, PVector _pos) {
    this.label = _s;
    this.position = _pos.copy();
    this.w = 3*radius;
    this.h = radius;
  }

  void run() {
    update();
    display();
  }

  void update() {
  }

  void display() {
    ellipseMode(RADIUS);
    rectMode(RADIUS);
    noStroke();

    if ( label != null ) {
      // text labels
      push();
        stroke(bgColor, 40);
        if ( this.isMouseInside() ) {
          if ( this.isPlaying ) {
            fill(iconColor, 200);
          } else {
            fill(bgColor, 20);
          }
        }
        rect(position.x, position.y, w, h, 12);
        fill(bgColor);
        textFont(utility, 16);
        text(label, position.x, position.y);
      pop();
    } else {

      // no text
      if ( this.isPlaying ) {
        bgColor = white;
        iconColor = black;
        push();
          fill(bgColor);
          ellipse(position.x, position.y, radius, radius);
          fill(iconColor);
          rect(position.x, position.y, radius/2, radius/2);
        pop();
      } else {
        bgColor = black;
        iconColor = white;
        push();
          fill(bgColor);
          ellipse(position.x, position.y, radius, radius);
          fill(iconColor);
          triangle(position.x + radius/2, position.y, 
              position.x + (radius) * cos(2*PI/3), position.y + (radius/2)*sin(2*PI/3),
              position.x + (radius) * cos(4*PI/3), position.y + (radius/2)*sin(4*PI/3) );
        pop();
      }
    }
  }

  boolean isMouseInside() {
    PVector m = new PVector(mouseX, mouseY);
    if ( this.label != null ) {
      if (( position.x - w <= m.x && m.x <= position.x + w ) && ( position.y - this.h <= m.y && m.y <= position.y + this.h )) {
        return true;
      } else {
         return false;
      }
    } else {
      if ( PVector.dist(m, position) <= this.radius ) {
        return true;
      } else {
        return false;
      }
    }
  }

  void setLabel(String s) {
    this.label = s;
  }

  void toggle() {
    this.isPlaying = !this.isPlaying;
  }
  
}
