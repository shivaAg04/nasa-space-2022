import 'package:flutter/material.dart';
import 'package:nasa_space2022/bottom_navigation_bar.dart';

import 'intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Nasa Space',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 60, 255, 236),
        ),
        home: CustomiseBottomNavigationBar());
  }
}
