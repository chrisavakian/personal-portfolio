import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Function(String) onNavClick;
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const NavBar({super.key, required this.onNavClick, required this.isDarkMode, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, // Smaller width for the sidebar
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: isDarkMode ? Colors.blueGrey[900] : Colors.white,
      child: Column(
        children: [
          // Navbar items
          NavItem(
            icon: Icons.person,
            text: 'About',
            onTap: () => onNavClick('about'),
            isDarkMode: isDarkMode,
          ),
          NavItem(
            icon: Icons.work,
            text: 'Projects',
            onTap: () => onNavClick('projects'),
            isDarkMode: isDarkMode,
          ),
          NavItem(
            icon: Icons.contact_mail,
            text: 'Contact',
            onTap: () => onNavClick('contact'),
            isDarkMode: isDarkMode,
          ),
          NavItem(
            icon: Icons.file_copy,
            text: 'Resume',
            onTap: () => onNavClick('resume'),
            isDarkMode: isDarkMode,
          ),
          const Spacer(), // Push the toggle button to the bottom
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: toggleTheme,
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final bool isDarkMode;

  const NavItem({super.key, required this.icon, required this.text, required this.onTap, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isDarkMode ? Colors.white : Colors.black),
          const SizedBox(height: 8),
          Text(text, style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
        ],
      ),
    );
  }
}
