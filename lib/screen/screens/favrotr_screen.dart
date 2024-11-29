import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:provider/provider.dart';

import '../../provider/space_provider.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SpaceProvider provider = Provider.of<SpaceProvider>(context);

    return SafeArea(
      child: Scaffold(
          body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/img/sky4.jpg',
                ),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                        size: 20,
                      )),
                  SizedBox(width: width * 0.05,),
                  Text(
                    'Liked Planets',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: provider.bookmarkedList.length,
                itemBuilder: (context, index) {
                  final planet = provider.bookmarkedList[index];
                  return ListTile(
                    leading: Hero(
                      tag: 'plants',
                      child: SizedBox(
                        height: height * 0.15,
                        width: width * 0.15,
                        child: ModelViewer(
                          src: planet.image,
                          arPlacement: ArPlacement.floor,
                          autoPlay: true,
                          autoRotate: true,
                          disableZoom: true,
                        ),
                      ),
                    ),
                    title: Text(
                      planet.name,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      planet.subtitle,
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.white),
                      onPressed: () {
                        provider.toggleBookmark(planet);
                        bookMark[index] = false;
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
