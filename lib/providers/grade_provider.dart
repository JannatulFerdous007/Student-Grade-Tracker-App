import 'package:flutter/material.dart';

import '../models/subject.dart';

class GradeProvider extends ChangeNotifier {
  final List<Subject> _subjects = [];
  int _currentIndex = 0;
  bool _isDarkMode = false;

  List<Subject> get subjects => _subjects;

  int get currentIndex => _currentIndex;

  bool get isDarkMode => _isDarkMode;

  int get totalSubjects => _subjects.length;

  double get averageMark {
    if (_subjects.isEmpty) {
      return 0;
    }

    final total = _subjects
        .map((subject) => subject.mark)
        .reduce((value, element) => value + element);

    return total / _subjects.length;
  }

  List<Subject> get passingSubjects {
    return _subjects.where((subject) => subject.mark >= 50).toList();
  }

  String get overallGrade {
    if (averageMark >= 80) {
      return 'A';
    } else if (averageMark >= 65) {
      return 'B';
    } else if (averageMark >= 50) {
      return 'C';
    } else {
      return 'F';
    }
  }

  void addSubject(String name, double mark) {
    _subjects.add(
      Subject(name: name, mark: mark),
    );
    notifyListeners();
  }

  void deleteSubject(int index) {
    _subjects.removeAt(index);
    notifyListeners();
  }

  void changeScreen(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
