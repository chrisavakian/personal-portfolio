import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import 'about_page.dart';
import 'projects_page.dart'; // Import the Projects page here
import 'contact_page.dart';
import 'resume_page.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  HomePage({required this.toggleTheme, required this.isDarkMode});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/about':
              return MaterialPageRoute(
                builder: (context) => AboutPage(isDarkMode: widget.isDarkMode),
              );
            case '/projects':
              return MaterialPageRoute(
                builder: (context) => ProjectsPage(isDarkMode: widget.isDarkMode),
              );
            // Add more routes as needed
            case '/contact':
              return MaterialPageRoute(
                builder: (context) => ContactPage(isDarkMode: widget.isDarkMode),
              );
            case '/resume':
              return MaterialPageRoute(
                builder: (context) => ResumePage(isDarkMode: widget.isDarkMode),
              );
            default:
              return MaterialPageRoute(
                builder: (context) => HomeContent(toggleTheme: widget.toggleTheme, isDarkMode: widget.isDarkMode),
              );
          }
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  HomeContent({required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavBar(
          isDarkMode: isDarkMode,
          toggleTheme: toggleTheme,
        ),
        Expanded(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Section(
                    title: 'Home',
                    content: Text(
                      'Welcome to the home page.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Section(
                    title: 'Resume',
                    content: Text(
                      'Resume content here.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final Widget content;

  Section({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(bottom: BorderSide(color: Colors.grey[700]!, width: 1.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 20),
          content,
        ],
      ),
    );
  }
}
