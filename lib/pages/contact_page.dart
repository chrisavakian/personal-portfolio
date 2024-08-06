import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  final bool isDarkMode;

  ContactPage({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: Center(
        child: Text(
          'This is the Contact page with some temporary text.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
