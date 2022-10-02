import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: ChangeNotifierProvider<GoogleSignInController>(
            create: (context) => GoogleSignInController(),
            child: Consumer<GoogleSignInController>(
              builder: (context, model, child) {
                return ListView(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      child: Image.network(imgPath),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Center(
                        //   child: CircleAvatar(
                        //     radius: 40.0,
                        //     backgroundImage: Image.network(
                        //             model.googleAccount!.photoUrl ?? 'w')
                        //         .image,
                        //   ),
                        // ),
                        Divider(
                          color: Colors.grey[800],
                          height: 40.0,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            child: Text(
                              'edit',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'NAME',
                          style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '$namePath',
                          style: TextStyle(
                            color: Color.fromARGB(255, 60, 255, 236),
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        const Text(
                          'Institute',
                          style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        const Text(
                          'KIET',
                          style: TextStyle(
                            color: Color.fromARGB(255, 60, 255, 236),
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        const Text(
                          'YEAR',
                          style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        const Text(
                          'THIRD YEAR',
                          style: TextStyle(
                            color: Color.fromARGB(255, 60, 255, 236),
                            fontWeight: FontWeight.bold,
                            fontSize: 19.0,
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.email,
                              color: Color.fromARGB(255, 60, 255, 236),
                            ),
                            SizedBox(width: 10.0),
                            FittedBox(
                              child: Text(
                                '$emailPath',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 15.0,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 30.0),
                        Row(
                          children: <Widget>[
                            // Icon(
                            //   Icons.inbox,
                            //   color: Color.fromARGB(255, 60, 255, 236),
                            // ),
                            // SizedBox(width: 10.0),
                            // Text(
                            //   '$idPath',
                            //   style: TextStyle(
                            //     color: Colors.grey[400],
                            //     fontSize: 18.0,
                            //     letterSpacing: 1.0,
                            //   ),
                            // )
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
