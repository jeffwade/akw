
void setup() {
 size(600,600);
  background(0,355,255); 
}

void draw() {
  if (mousePressed) {
    background(0,255,255);
 drawBalloons();
 } else {
  background(0,255,255);
  fill(0,255,255);
  line(10,100,10,150);
  line(10,125,50,125);
  line(50,100,50,150);
 ellipse(70,138,30,30);
 ellipse(110,138,30,30);
 ellipse(148,138,30,30);
  arc(189,138,35,35,0,PI);
  arc(410,138,40,35,0,PI);
  arc(370,138,35,35,PI,TAU);
  arc(408,138,35,35,PI,TAU);
  arc(460,120,40,40,PI,TAU);
  arc(189,185,35,35,0,PI);
 ellipse(289,138,30,30);
  line(87,150,87,125);
  line(305,150,305,125);
  line(132,125,132,190);
  line(205,135,205,190);
  line(94,125,94,190);
  line(250,50,250,138);
  line(350,50,350,138);
  line(325,100,325,147);
  line(440,100,440,147);
  line(250,50,300,50);
  line(320,120,330,120);
  line(250,75,275,75);
  line(394,138,420,138);
  line(523,50,514,60);
  line(250,300,250,400);
  arc(270,350,100,100,-HALF_PI,HALF_PI);
  arc(520,130,35,35,-HALF_PI,HALF_PI);
  arc(530,100,35,35,HALF_PI,PI*HALF_PI);
  line(400,350,400,400);
  line(450,350,450,450);
  ellipse(370,375,50,50);
  arc(430,350,40,40,0,PI);
  arc(430,453,40,40,0,PI);
}
}

void drawBalloons() {
pushStyle();
fill(255,0,0);
 ellipse(150,140,78,87);
 ellipse(450,140,78,87);
 ellipse(50,230,78,87);
 ellipse(550,230,78,87);
 ellipse(300,50,78,87);
popStyle();
 line(150,325,150,205);
 line(300,100,300,200);
 line(550,300,550,400);
 line(450,325,450,205);
 line(50,300,50,400);
}
