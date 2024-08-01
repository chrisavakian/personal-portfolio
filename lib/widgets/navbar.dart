import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
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
              TextButton(onPressed: () {}, child: Text('Home', style: TextStyle(color: Colors.white))),
              TextButton(onPressed: () {}, child: Text('About', style: TextStyle(color: Colors.white))),
              TextButton(onPressed: () {}, child: Text('Projects', style: TextStyle(color: Colors.white))),
              TextButton(onPressed: () {}, child: Text('Contact', style: TextStyle(color: Colors.white))),
            ],
          )
        ],
      ),
    );
  }
}
