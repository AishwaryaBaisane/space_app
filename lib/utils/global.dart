import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../provider/space_provider.dart';

List<String> plants = [
  'assets/img/mars.glb',
  'assets/img/moon.glb',
  'assets/img/saturn.glb',
  'assets/img/uranus.glb',
  'assets/img/venus.glb',
  'assets/img/jupiter.glb',
  'assets/img/pluto.glb',
  'assets/img/neptune.glb',
  'assets/img/sun.glb',
  'assets/img/earth.glb',
];


// Stack buildStack(
//     double height, SpaceProvider plantsData, double width, int index) {
//   return Stack(
//     children: [
//       Padding(
//         padding: const EdgeInsets.only(top: 60),
//         child: Card(
//           color: Colors.black26,
//           margin: EdgeInsets.all(20.0),
//           elevation: 5.0,
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: height * 0.15,
//                     ),
//                     Text(
//                       plantsData.dataList[index].name,
//                       style: TextStyle(
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                     SizedBox(height: 8.0),
//                     Text(
//                       plantsData.dataList[index].description,
//                       style: TextStyle(fontSize: 16.0, color: Colors.white),
//                     ),
//                     SizedBox(height: 16.0),
//                     // ElevatedButton(
//                     //   onPressed: () {
//                     //     // Navigate to the detail screen
//                     //     Navigator.pushNamed(context, '/mars_detail');
//                     //   },
//                     //   child: Text('Detail'),
//                     // ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       Positioned(
//         top: -15,
//         left: width * 0.3,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Hero(
//                 tag: 'plants',
//                 child: Container(
//                   width: 210,
//                   height: 165,
//                   // color: Colors.black,
//                   child: Center(
//                     child: ModelViewer(
//                       src: plantsData.dataList[index].image,
//                       arPlacement: ArPlacement.floor,
//                       autoPlay: true,
//                       autoRotate: true,
//                       disableZoom: true,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: width * 0.1,
//               )
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }