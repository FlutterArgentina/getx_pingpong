class Point {
  double x;
  double y;

  Point({this.x, this.y});

  void set(double x, double y) {
    this.x = x;
    this.y = y;
  }

  @override
  String toString() {
    return 'Point{x: $x, y: $y}';
  }
}
