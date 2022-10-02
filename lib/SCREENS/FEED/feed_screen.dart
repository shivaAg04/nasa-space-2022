import 'package:flutter/material.dart';
import 'package:nasa_space2022/WIDGETS/feed_post_blueprint.dart';

class feed extends StatelessWidget {
  const feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 60, 255, 236),
      //   title: const Text(
      //     "Home",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   centerTitle: true,
      // ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return FeedBlueprint();
        },
        itemCount: 10,
      ),
    );
  }
}
