import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 90),
          child: Lottie.asset(
            'assets/lottie/welcome.json',
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
        ),
        Spacer(),
        const InkWell(
          child: Text(
            "REGISTER",
            style: TextStyle(fontSize: 30, color: Colors.purple),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const InkWell(
          child: Text(
            "LOGIN",
            style: TextStyle(fontSize: 30, color: Colors.indigo),
          ),
        ),
        SizedBox(
          height: 40,
        )
      ],
    ));
  }
}
