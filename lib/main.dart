import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'providers/grade_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GradeProvider(),
      child: const MyApp(),
    ),
  );
}
