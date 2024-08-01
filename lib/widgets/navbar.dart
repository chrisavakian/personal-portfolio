import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Function(String) onNavClick;
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  NavBar({
    required this.onNavClick,
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
          SizedBox(height: 40), // Spacing from the top
          buildNavItem(context, 'about', Icons.person),
          SizedBox(height: 20), // Spacing between items
          buildNavItem(context, 'projects', Icons.work),
          SizedBox(height: 20), // Spacing between items
          buildNavItem(context, 'contact', Icons.contact_mail),
          SizedBox(height: 20), // Spacing between items
          buildNavItem(context, 'resume', Icons.picture_as_pdf),
          Spacer(), // Pushes the toggle button to the bottom
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

  Widget buildNavItem(BuildContext context, String section, IconData icon) {
    return InkWell(
      onTap: () => onNavClick(section),
      child: Column(
        children: [
          Icon(icon, size: 24),
          SizedBox(height: 8),
          Text(
            section[0].toUpperCase() + section.substring(1),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
