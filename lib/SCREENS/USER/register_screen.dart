import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_space2022/SCREENS/BOTTOM%20BAR/front_page.dart';
import 'package:nasa_space2022/SCREENS/USER/login_page.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_space2022/SCREENS/welcome_screen.dart';

TextEditingController instituteInput = TextEditingController();
TextEditingController specializationInput = TextEditingController();
TextEditingController achievementInput = TextEditingController();
TextEditingController about_me_Input = TextEditingController();
TextEditingController socialLinkInput = TextEditingController();

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          SizedBox(
            child: Lottie.asset('assets/lottie/profile.json'),
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  instituteInput.text = value.toString();
                  instituteInput.selection = TextSelection.fromPosition(
                      TextPosition(offset: instituteInput.text.length));
                });
              },
              controller: instituteInput,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Enter your institute name',
                focusColor: Colors.green,
                prefixIcon: Icon(
                  Icons.work,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  specializationInput.text = value.toString();
                  specializationInput.selection = TextSelection.fromPosition(
                      TextPosition(offset: specializationInput.text.length));
                });
              },
              controller: specializationInput,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Enter your specialization here',
                focusColor: Colors.blue,
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  achievementInput.text = value.toString();
                  achievementInput.selection = TextSelection.fromPosition(
                      TextPosition(offset: achievementInput.text.length));
                });
              },
              controller: achievementInput,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Enter your achievements here',
                focusColor: Colors.blue,
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  about_me_Input.text = value.toString();
                  about_me_Input.selection = TextSelection.fromPosition(
                      TextPosition(offset: about_me_Input.text.length));
                });
              },
              controller: about_me_Input,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Enter your bio here',
                focusColor: Colors.blue,
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  socialLinkInput.text = value.toString();
                  socialLinkInput.selection = TextSelection.fromPosition(
                      TextPosition(offset: socialLinkInput.text.length));
                });
              },
              controller: socialLinkInput,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Enter your social links here\n'
                    '(Linkedin, Github etc.',
                focusColor: Colors.blue,
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          ActionChip(
              avatar: Icon(Icons.done),
              label: Text(
                'Submit',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () async {
                Map<String, String> data = {
                  'picture': 'xyz',
                  'email': 'ab@gmail.com',
                  'institute': instituteInput.text,
                  'specialization': specializationInput.text,
                  'achievements': achievementInput.text,
                  'about_me': about_me_Input.text,
                  'social_link': socialLinkInput.text,
                  'user_type': 'USER',
                };
                final uri =
                    Uri.parse('https://1d4b-125-21-249-98.ngrok.io/profile/');
                final headers = {'Content-Type': 'application/json'};
                Map<String, String> body = data;
                String jsonBody = json.encode(body);
                final encoding = Encoding.getByName('utf-8');

                Response response = await post(
                  uri,
                  headers: headers,
                  body: jsonBody,
                  encoding: encoding,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FrontPage()),
                );
                // if (response.statusCode == 201) {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => FrontPage()),
                //   );
                // }
              })
        ],
      ),
    );
  }
}
