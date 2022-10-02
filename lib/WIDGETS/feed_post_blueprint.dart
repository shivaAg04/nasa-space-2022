import 'package:flutter/material.dart';

class FeedBlueprint extends StatelessWidget {
  late int iindex;
  FeedBlueprint(this.iindex, {Key? key}) : super(key: key);
  List<String> NASAIMAGE = [
    'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA25551.jpg',
    'https://www.nasa.gov/sites/default/files/thumbnails/image/curiosity_selfie.jpg',
    'https://qtxasset.com/cdn-cgi/image/w=850,h=478,f=auto,fit=crop,g=0.5x0.5/https://qtxasset.com/quartz/qcloud4/media/image/fierceelectronics/1637693942/DART%20mission.jpg?VersionId=JyQv7cpw4VREJ6apEAP7yN28vNcub7JH'
        'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA24908.jpg',
    'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA25329.jpg',
    'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA25411.jpg',
    'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA25531.jpg',
    'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA25408.jpg',
    'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA24925.jpg',
    'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA25244.jpg',
    'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA24925.jpg',
    'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA25551.jpg',
    'https://www.nasa.gov/sites/default/files/thumbnails/image/curiosity_selfie.jpg',
    'https://qtxasset.com/cdn-cgi/image/w=850,h=478,f=auto,fit=crop,g=0.5x0.5/https://qtxasset.com/quartz/qcloud4/media/image/fierceelectronics/1637693942/DART%20mission.jpg?VersionId=JyQv7cpw4VREJ6apEAP7yN28vNcub7JH'
        'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA24908.jpg',
    'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA25329.jpg',
    'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA25411.jpg',
    'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA25531.jpg',
    'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA25408.jpg',
    'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA24925.jpg',
    'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA25244.jpg',
    'https://d2pn8kiwq2w21t.cloudfront.net/original_images/jpegPIA24925.jpg'
  ];

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
                    NASAIMAGE[iindex],
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 13,
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(12),
                    child: const Text(
                      "Title :ispsum laurem",
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
            // Padding(
            //   padding: EdgeInsets.all(20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       Row(
            //         children: [
            //           Icon(Icons.schedule),
            //           SizedBox(
            //             width: 6,
            //           ),
            //           Text('    min')
            //         ],
            //       ),
            //       Row(
            //         children: [
            //           Icon(Icons.work),
            //           SizedBox(
            //             width: 6,
            //           ),
            //           Text("complexityTest"),
            //         ],
            //       ),
            //       Row(
            //         children: [
            //           Icon(Icons.attach_money),
            //           SizedBox(
            //             width: 6,
            //           ),
            //           Text("affordabilityTest"),
            //         ],
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
