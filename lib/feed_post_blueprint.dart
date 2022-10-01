import 'package:flutter/material.dart';

class FeedBlueprint extends StatelessWidget {
  const FeedBlueprint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        // color: Colors.white,
        color: Color.fromARGB(255, 60, 255, 236),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    'https://qtxasset.com/cdn-cgi/image/w=850,h=478,f=auto,fit=crop,g=0.5x0.5/https://qtxasset.com/quartz/qcloud4/media/image/fierceelectronics/1637693942/DART%20mission.jpg?VersionId=JyQv7cpw4VREJ6apEAP7yN28vNcub7JH',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 13,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding: EdgeInsets.all(12),
                    child: const Text(
                      "title",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('    min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text("complexityTest"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text("affordabilityTest"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
