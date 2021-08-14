void runSegments(boolean _status) {
  // loop through array of pushButtons
  for ( Segment s : segments) {
    if ( segments.size() > 0 ) {
      float _t = s.segTimer.getDuration();
      // float _w = map(_t, )
      s.setWidth(width/segments.size());
    }
    s.run(_status);
  }
}

