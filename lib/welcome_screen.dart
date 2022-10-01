import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
          ),
          Lottie.asset(
            'assets/lottie/welcome.json',
            width: 300,
            height: 300,
            fit: BoxFit.fill,
          ),
          Spacer(),
          const InkWell(
            child: Text(
              "REGISTER",
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          const InkWell(
            child: Text(
              "LOGIN",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                  color: Colors.indigo),
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    ));
  }
}
