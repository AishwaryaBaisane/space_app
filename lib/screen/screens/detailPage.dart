import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:provider/provider.dart';

import '../../provider/space_provider.dart';

class DetailPage extends StatefulWidget {
  int index;

  DetailPage({required this.index, super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SpaceProvider plantsData = Provider.of<SpaceProvider>(context);
    // final isBookmarked = plantsData.bookmarkedList.contains(planet);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage(
        'assets/img/sky4.jpg',
    ),
    fit: BoxFit.cover)),
    child:Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(17),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.1,
                        ),
                        Text(
                          'Distance',
                          style: TextStyle(color: Colors.white70, fontSize: 17),
                        ),
                        Text(
                          '${plantsData.dataList[widget.index].distance}6,73,53454 MI KM',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Text(
                          'Gravity',
                          style: TextStyle(color: Colors.white70, fontSize: 17),
                        ),
                        Text(
                          '${plantsData.dataList[widget.index].gravity}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Text(
                          'Days',
                          style: TextStyle(color: Colors.white70, fontSize: 17),
                        ),
                        Text(
                          '${plantsData.dataList[widget.index].length_of_day}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Text(
                          'Velocity',
                          style: TextStyle(color: Colors.white70, fontSize: 17),
                        ),
                        Text(
                          '${plantsData.dataList[widget.index].velocity}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.15,
                  ),
                  Hero(
                    tag: 'plants',
                    child: SizedBox(
                      height: height * 0.5,
                      width: width * 0.7,
                      child: ModelViewer(
                        src: plantsData.dataList[widget.index].image,
                        arPlacement: ArPlacement.floor,
                        autoPlay: true,
                        autoRotate: true,
                        disableZoom: true,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(17),
                  child: Column(
                    children: [
                      Text(
                        plantsData.dataList[widget.index].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.1,
                ),
               Row(
                 children: [
                   IconButton(
                     onPressed: () {
                       setState(() {
                         plantsData
                             .toggleBookmark(plantsData.dataList[widget.index]);
                         bookMark[widget.index] = true;
                       });
                     },
                     icon: Icon(
                       bookMark[widget.index] ? Icons.favorite : Icons.favorite_border,
                       color: Colors.white,
                     ),
                   ),
                   IconButton(
                     onPressed: () {},
                     icon: Icon(
                       Icons.save_alt,
                       color: Colors.white,
                     ),
                   ),
                 ],
               )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.3,
                        width: width * 0.9,
                        child: Text(
                          ' ${plantsData.dataList[widget.index].description}',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),)
    );
  }
}


// Column(
//           children: [
//             Hero(
//               tag: 'plants',
//               child: Center(
//                 child: Container(
//                   width: 300,
//                   height: 300,
//                   color: Colors.black,
//                   child: Center(
//                     child: ModelViewer(
//                       src: plantsData.dataList[index].image,
//                       arPlacement: ArPlacement.floor,
//                       autoPlay: true,
//                       autoRotate: true,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
