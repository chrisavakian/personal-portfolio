import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  final bool isDarkMode;

  ProjectsPage({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
      ),
      body: Center(
        child: Text(
          'This is the Projects page with some temporary text.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
