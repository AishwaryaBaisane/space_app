// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';
//
//
// List<String> plants = [
//   'assets/img/mars.glb',
//   'assets/img/moon.glb',
//   'assets/img/saturn.glb',
//   'assets/img/uranus.glb',
//   'assets/img/venus.glb',
//   'assets/img/jupiter.glb',
//   'assets/img/pluto.glb',
//   'assets/img/neptune.glb',
//   'assets/img/sun.glb',
//   'assets/img/earth.glb',
// ];
//
// class OrbitingImages extends StatefulWidget {
//   @override
//   _OrbitingImagesState createState() => _OrbitingImagesState();
// }
//
// class _OrbitingImagesState extends State<OrbitingImages>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   double radius = 100; // Orbit radius
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 10),
//     )..repeat(); // Make it repeat forever
//
//     _controller.addListener(() {
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double angle = _controller.value * 2 * pi; // Get the angle for rotation
//     double centerX = MediaQuery.of(context).size.width / 2;
//     double centerY = MediaQuery.of(context).size.height / 2;
//
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       // color: Colors.black,
//       child: Stack(
//         children: [...List.generate(plants.length, (index) {
//           // Number of images in orbit
//           double angleOffset =
//               (2 * pi / plants.length) * index; // Distribute images
//           double xPos = (radius + 200) *
//               cos(angle + angleOffset); // Increase orbit radius
//           double yPos = (radius + 200) * sin(angle + angleOffset);
//           // double angleOffset =
//           //     (2 * pi / 7) * index; // Evenly distribute the images
//           // double xPos = radius * cos(angle + angleOffset);
//           // double yPos = radius * sin(angle + angleOffset);
//
//           return Positioned(
//             left: 360 + xPos - 60, // Center the orbit at (150,150)
//             top: 300 + yPos - 10, // Offset by -20 for image size
//             child: Container(
//               width: 150,
//               height: 150,
//               // color: Colors.black,
//               child: ModelViewer(
//                 // backgroundColor: Colors.black,
//                 src: plants[index],
//                 // autoRotate: true,
//                 // autoPlay: true,
//                 arPlacement: ArPlacement.floor,
//                 cameraControls: false,
//                 // ),Image.asset(
//                 //   'assets/planet${index + 1}.png', // Replace with your image asset
//                 //   width: 40,  // Image size
//                 //   height: 40, // Image size
//                 // ),
//               ),
//             ),
//           );
//         }),
//       ]
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../utils/global.dart';


class OrbitingImages extends StatefulWidget {
  @override
  _OrbitingImagesState createState() => _OrbitingImagesState();
}

class _OrbitingImagesState extends State<OrbitingImages>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double radius = 200; // Orbit radius

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat(); // Make it repeat forever

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double angle = _controller.value * 2 * pi; // Get the angle for rotation

    // Get screen center
    double centerX = MediaQuery.of(context).size.width / 2;
    double centerY = MediaQuery.of(context).size.height / 2;

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: List.generate(plants.length, (index) {
          // Distribute images evenly in the orbit
          double angleOffset =
              (2 * pi / plants.length) * index; // Distribute images
          double xPos = (radius + 200) *
              cos(angle + angleOffset); // Increase orbit radius
          double yPos = (radius + 200) * sin(angle + angleOffset);
          // double xPos = radius * cos(angle + angleOffset);
          // double yPos = radius * sin(angle + angleOffset);

          return Positioned(
            left: centerX + 280 + xPos - 75, // Center horizontally
            top: centerY + yPos - 75, // Center vertically
            child: Container(
              width: 200,
              height: 200,
              color: Colors.black,
              // color: (plants[index] == 'assets/img/pluto.glb')?Colors.black:null,
              child: ModelViewer(
                src: plants[index],
                arPlacement: ArPlacement.floor,
                // cameraControls: false,
                autoPlay: true,
                autoRotate: true,
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
