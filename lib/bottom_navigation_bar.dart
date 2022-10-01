import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nasa_space2022/events_screen.dart';
import 'package:nasa_space2022/feed_screen.dart';
import 'package:nasa_space2022/user_screen.dart';

class CustomiseBottomNavigationBar extends StatefulWidget {
  const CustomiseBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomiseBottomNavigationBar> createState() =>
      _CustomiseBottomNavigationBar();
}

class _CustomiseBottomNavigationBar
    extends State<CustomiseBottomNavigationBar> {
  int i = 1;
  // ignore: empty_constructor_bodies

  final List<Widget> _screenWidget = [
    // AdsControlScreen(),
    const EventsScreen(),
    const feed(),
    const User(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenWidget[i],
      bottomNavigationBar: CurvedNavigationBar(
        items: const <Widget>[
          Icon(
            Icons.add_sharp,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.home,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.black,
            size: 20,
          ),
        ],
        animationDuration: const Duration(milliseconds: 300),
        height: 50,
        onTap: (index) {
          setState(() {
            i = index;
          });
        },
        animationCurve: Curves.easeInOutSine,
        // animationCurve: Curves.decelerate,
        buttonBackgroundColor: Color.fromARGB(255, 60, 255, 236),
        color: Color.fromARGB(255, 60, 255, 236),
        backgroundColor: Colors.white,
      ),
    );
  }
}
