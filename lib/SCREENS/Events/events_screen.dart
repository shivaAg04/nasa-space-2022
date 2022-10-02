import 'package:flutter/material.dart';
import 'package:nasa_space2022/SCREENS/Events/add_new_event_screen.dart';

import 'add_new_event_screen.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AddNewEventScreen()),
                );
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
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
