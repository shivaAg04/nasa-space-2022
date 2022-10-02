import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_space2022/SCREENS/welcome_screen.dart';

import 'login_page.dart';

class ConcentricTransition extends StatefulWidget {
  const ConcentricTransition({Key? key}) : super(key: key);

  @override
  _ConcentricTransitionState createState() => _ConcentricTransitionState();
}

class _ConcentricTransitionState extends State<ConcentricTransition> {
  List<dynamic> pages = [
    {
      'image':
          'https://ouch-cdn2.icons8.com/yIxQmzj1OHH3S9AiIgelaTGdpj3wApWqSqFh80arSEA/rs:fit:784:828/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMTMx/L2NmOGIzZmY4LWRh/YjEtNDdiMS1hZGQ4/LWFkMTUwZTQwNzIx/NC5wbmc.png',
    },
    {
      'image':
          'https://ouch-cdn2.icons8.com/oEXWmNUZgj3vd_T5XSJe2dTB1GFWIBeJ1QEqRWw76O8/rs:fit:784:748/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMzM1/L2Q3MjMyYzJlLTk0/NTMtNDUzMC1iZTEx/LWQ2MDZiN2RjYmFm/Yy5wbmc.png'
    },
    {
      'image':
          'https://ouch-cdn2.icons8.com/g8bZd-d4qiYuomOBWh3x61II6HlK8Ir2zp_a2cFTcCA/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNDI4/LzdjMjEyYjgzLTg0/NjQtNDQzMS04NzAz/LTNkNzk1YmUyMzli/MC5wbmc.png'
    }
  ];
  List<String> introLottie = [
    "assets/lottie/student.json",
    "assets/lottie/space.json",
    "assets/lottie/astronaut.json"
  ];
  List<String> introText = ["NASA APP", "DEMO TEXT", "DEMO TEXT"];
  List<Color> introTextColor = [Colors.pinkAccent, Colors.white, Colors.white];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConcentricPageView(
      duration: Duration(milliseconds: 600),
      onFinish: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LoginPage(),
          ),
        );
      },
      radius: 30,
      verticalPosition: 0.85,
      colors: [
        Colors.white,
        Colors.pinkAccent,
        Colors.purple,
      ],
      itemBuilder: (
        index,
      ) {
        int pageIndex = (index % pages.length);
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                introLottie[index],
                width: 300,
                height: 300,
                fit: BoxFit.fill,
              ),
              Center(
                child: Text(
                  introText[index],
                  style: TextStyle(
                    color: introTextColor[index],
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ),

              // Image.network(
              //   pages[pageIndex]['image'],
              //   width: 300,
              // )
            ],
          ),
        );
      },
    ));
  }
}
