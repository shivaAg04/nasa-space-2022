import 'package:flutter/material.dart';
import 'package:nasa_space2022/SCREENS/register_screen.dart';
import 'package:nasa_space2022/bottom_navigation_bar.dart';
import 'package:nasa_space2022/SCREENS/login_page.dart';
import 'package:nasa_space2022/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoogleSignInController(),
          child: LoginPage(),
        )
      ],
      child: MaterialApp(
          title: 'Nasa Space',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color.fromARGB(255, 60, 255, 236),
          ),
          home: LoginPage()),
    );
  }
}
