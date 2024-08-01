import 'package:flutter/material.dart';
import '../widgets/navbar.dart'; // Make sure this import is correct
import 'about_page.dart'; // Import other pages here if needed


class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  HomePage({required this.toggleTheme, required this.isDarkMode});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavBar(
            isDarkMode: widget.isDarkMode,
            toggleTheme: widget.toggleTheme,
          ),
          Expanded(
            child: Navigator(
              key: _navigatorKey,
              onGenerateRoute: (RouteSettings settings) {
                switch (settings.name) {
                  case '/about':
                    return MaterialPageRoute(
                      builder: (context) => AboutPage(isDarkMode: widget.isDarkMode),
                    );
                  default:
                    return MaterialPageRoute(
                      builder: (context) => HomeContent(),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
