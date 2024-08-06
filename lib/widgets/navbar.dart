import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  NavBar({
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Icon(Icons.star, size: 30),
          SizedBox(height: 20),
          buildNavItem(context, 'About', Icons.person, '/about'),
          SizedBox(height: 20),
          buildNavItem(context, 'Projects', Icons.work, '/projects'),
          SizedBox(height: 20),
          buildNavItem(context, 'Contact', Icons.contact_mail, '/contact'),
          SizedBox(height: 20),
          buildNavItem(context, 'Resume', Icons.picture_as_pdf, '/resume'),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: toggleTheme,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavItem(BuildContext context, String title, IconData icon, String route) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Column(
        children: [
          Icon(icon, size: 24),
          SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
