import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/grade_provider.dart';
import 'screens/add_subject_screen.dart';
import 'screens/subject_list_screen.dart';
import 'screens/summary_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xfff4f6f8),
    primaryColor: const Color(0xff3f51b5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff3f51b5),
      foregroundColor: Color(0xffffffff),
    ),
    cardColor: const Color(0xffffffff),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(0xff3f51b5),
      unselectedItemColor: Color(0xff777777),
      backgroundColor: Color(0xffffffff),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xff222222)),
      titleLarge: TextStyle(color: Color(0xff222222)),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xff3f51b5),
      secondary: Color(0xff009688),
      error: Color(0xffd32f2f),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff121212),
    primaryColor: const Color(0xff90caf9),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1f1f1f),
      foregroundColor: Color(0xffffffff),
    ),
    cardColor: const Color(0xff1e1e1e),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(0xff90caf9),
      unselectedItemColor: Color(0xffaaaaaa),
      backgroundColor: Color(0xff1e1e1e),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xffffffff)),
      titleLarge: TextStyle(color: Color(0xffffffff)),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff90caf9),
      secondary: Color(0xff80cbc4),
      error: Color(0xffef9a9a),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<GradeProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          title: 'Student Grade Tracker',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: provider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const MainScreen(),
        );
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Widget> screens = const [
    AddSubjectScreen(),
    SubjectListScreen(),
    SummaryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<GradeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Student Grade Tracker')),
          body: screens[provider.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.currentIndex,
            onTap: provider.changeScreen,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Subjects',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.summarize),
                label: 'Summary',
              ),
            ],
          ),
        );
      },
    );
  }
}
