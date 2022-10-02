import 'package:flutter/material.dart';
import 'package:nasa_space2022/SCREENS/Events/add_new_event_screen.dart';

class MyEvent extends StatelessWidget {
  const MyEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 255, 236),
        title: const Text(
          "MY Events",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
    );
  }
}
