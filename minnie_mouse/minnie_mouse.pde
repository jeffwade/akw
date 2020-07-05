import processing.pdf.*;

void setup() {
  size(800,800);
  noLoop();
  beginRecord(PDF, "minnie mouse.pdf");
}

void draw() {
  fill(0);
  ellipse(400,400,300,300);
  ellipse(250,200,200,200);
  ellipse(550,200,200,200);
  pushStyle();
    fill(200,0,150);
    arc(300,200,150,150, -HALF_PI, HALF_PI, CHORD);
    arc(500,200,150,150, HALF_PI, 3*HALF_PI, CHORD);
     ellipse(400,200,60,60);
  popStyle();
  pushStyle();
    fill(200,150,150);
    arc(400,400,220,220, PI, TAU);
    arc(400,400,300,300, 0, PI);
    arc(400,450,150,150, PI, TAU);
  popStyle();
    ellipse(400,420,50,25);
  pushStyle();
    fill(230);
    ellipse(350,350,50,100);
    ellipse(450,350,50,100);
  popStyle();
    ellipse(350,350,25,50);
    ellipse(450,350,25,50);
    arc(400,460,160,150,0,PI);
 pushStyle();
   fill(255,0,0);
   ellipse(400,526,70,25);
 popStyle();
   endRecord();
}
