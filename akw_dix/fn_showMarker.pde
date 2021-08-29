void showMarker() {
  float _t = millis();
  float markerX = map(_t, 0, tTotal, 0, width);
  int markerRadius = 60;

  push();
    ellipseMode(CENTER);
    fill(black);
    ellipse(markerX, height - 20, markerRadius + 2, markerRadius + 2);
    fill(white);
    ellipse(markerX, height-20, markerRadius, markerRadius);
  pop();
}
