import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_space2022/user_screen.dart';
import 'package:provider/provider.dart';

class GoogleSignInController with ChangeNotifier {
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;
  login() async {
    googleAccount = await _googleSignIn.signIn();
    notifyListeners();
  }

  logout() async {
    googleAccount = await _googleSignIn.signOut();
    notifyListeners();
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool content = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Lottie.asset('assets/lottie/nasa-worm-logo.json'),
            loginUI(),
          ],
        ),
      ),
    );
  }

  loginUI() {
    return Consumer<GoogleSignInController>(builder: (context, model, child) {
      if (model.googleAccount != null) {
        return Center(child: loggedInUI(model));
      } else {
        return loginControls(context);
      }
    });
  }

  loginControls(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 3.0
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(10.0) //                 <--- border radius here
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                  height: 50,
                  width: 50,
                  child: Lottie.asset('assets/lottie/google-logo-effect.json')),
              SizedBox(width: 10,),
              Text(
                'Sign in with Google',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Provider.of<GoogleSignInController>(context, listen: false).login();
      },
    );
  }

  loggedInUI(GoogleSignInController model) {
    return Column(
      children: [
        CircleAvatar(
            radius: 75,
            backgroundImage:
                Image.network(model.googleAccount!.photoUrl ?? '').image),
        ActionChip(
            label: Text('Logout'),
            onPressed: () {
              Provider.of<GoogleSignInController>(context, listen: false)
                  .logout();
            }),
        Text('You are logged in as\n'),
        Text(model.googleAccount!.displayName ?? ''),
        ActionChip(
            label: Text('hy'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => User()),
              );
            })
      ],
    );
  }
}
