class Subject {
  final String name;
  final double _mark;

  Subject({
    required this.name,
    required double mark,
  }) : _mark = mark;

  double get mark => _mark;

  String get grade {
    if (_mark >= 80) {
      return 'A';
    } else if (_mark >= 65) {
      return 'B';
    } else if (_mark >= 50) {
      return 'C';
    } else {
      return 'F';
    }
  }
}
