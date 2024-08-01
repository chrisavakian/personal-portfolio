import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey[800],
        hintColor: Colors.blueAccent,
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyLarge: const TextStyle(color: Colors.white),
              bodyMedium: const TextStyle(color: Colors.white70),
              displayLarge: const TextStyle(color: Colors.white, fontSize: 32),
              titleLarge: const TextStyle(color: Colors.white70),
            ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[900],
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}
