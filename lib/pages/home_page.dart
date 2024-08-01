import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/about.dart';
import '../widgets/projects.dart';
import '../widgets/contact.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(),
            AboutSection(),
            ProjectsSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
