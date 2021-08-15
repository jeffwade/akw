void play() {
  playtime = playTimer.getElapsed();
  modulus = min(segments.size(), headlines.length);

  if ( playtime > tNext ) {
    segmentCount++;
    segmentCount = segmentCount%segments.size();
    headlineCount++;
    headlineCount = headlineCount%headlines.length;
    tNext += segments.get(segmentCount).getDuration();
  }
  segments.get(segmentCount).run(isPlaying);
  showHeadline(headlineCount);
}

void showHeadline(int i) {
  push();
    textFont(headlineFont);
    textAlign(CENTER, CENTER);
    fill(white);
    text(headlines[i], center.x, center.y + 40);
  pop();
}
