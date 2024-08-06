import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  final bool isDarkMode;

  ResumePage({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume'),
      ),
      body: Center(
        child: Text(
          'This is the resume page with some temporary text.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
