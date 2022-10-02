import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        backgroundColor: const Color.fromARGB(255, 60, 255, 236),
        title: const Text(
          "Events",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
    );
  }
}
