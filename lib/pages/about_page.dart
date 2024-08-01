import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final bool isDarkMode;

  const AboutPage({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This is the About page with some temporary text.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
