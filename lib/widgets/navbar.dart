import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Function(String) onNavClick;

  NavBar({required this.onNavClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('My Portfolio', style: TextStyle(color: Colors.white, fontSize: 24)),
          Row(
            children: [
              TextButton(
                onPressed: () => onNavClick('about'),
                child: Text('About', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () => onNavClick('projects'),
                child: Text('Projects', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () => onNavClick('contact'),
                child: Text('Contact', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () => onNavClick('resume'),
                child: Text('Resume', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
