import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'events_screen.dart';
import 'feed_screen.dart';
import 'user_screen.dart';

class FrontPage extends StatefulWidget {
  FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {

  int _currentIndex = 0;
  final List<Widget> _screenWidget = [
    // AdsControlScreen(),
    const feed(),
    const EventsScreen(),
    const EventsScreen(),

    const User(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenWidget[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.black,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            inactiveColor: Color.fromARGB(255, 60, 255, 236),
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.yellow,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Color.fromARGB(255, 60, 255, 236),
            icon: Icon(Icons.event),
            title: Text('Events'),
            activeColor: Colors.lightBlue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Color.fromARGB(255, 60, 255, 236),
            icon: Icon(Icons.message),
            title: const Text(
              'Messages  ',
            ),
            activeColor: Color.fromARGB(255, 78, 255, 90),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Color.fromARGB(255, 60, 255, 236),
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
            activeColor: Color.fromARGB(255, 255, 166, 0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}