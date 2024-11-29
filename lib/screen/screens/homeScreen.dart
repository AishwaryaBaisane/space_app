import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:provider/provider.dart';
import 'package:space_app/screen/screens/detailPage.dart';
import 'package:space_app/screen/screens/favrotr_screen.dart';
import '../../provider/space_provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

// int index = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final ScrollController _scrollController = ScrollController();
    SpaceProvider plantsData = Provider.of<SpaceProvider>(context);

    void _scrollLeft() {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.offset - 250, // Adjust scroll amount
          duration: Duration(milliseconds: 50),
          curve: Curves.easeInOut,
        );
      }
    }

    void _scrollRight() {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.offset + 250, // Adjust scroll amount
          duration: Duration(milliseconds: 50),
          curve: Curves.easeInOut,
        );
      }
    }

    return Scaffold(
        // backgroundColor: Colors.black,
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/img/sky4.jpg',
              ),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/img/profile.jpg'),
                  ),
                ),
                Text(
                  'Space',
                  style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Hi Aish,',
                style: GoogleFonts.roboto(fontSize: 22, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Discover your planet and its wonders!",
                style: GoogleFonts.roboto(
                    fontSize: 25,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: height * 0.32,
                          ),
                          IconButton(
                            onPressed: _scrollLeft,
                            icon: Icon(Icons.arrow_back_ios_outlined),
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 250,
                        height: 400,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: _scrollController,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...List.generate(plantsData.dataList.length,
                                  (index) {
                                final planetData = plantsData.dataList[index];
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 18),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: height * 0.04,
                                        ),
                                        Hero(
                                          tag: 'plants',
                                          child: Container(
                                            width: 210,
                                            height: 165,
                                            // color: Colors.black,
                                            child: Center(
                                              child: ModelViewer(
                                                src: planetData.image,
                                                arPlacement: ArPlacement.floor,
                                                autoPlay: true,
                                                autoRotate: true,
                                                disableZoom: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.13,
                                        ),
                                        Text(
                                          planetData.subtitle,
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 15,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            print(
                                                '45678987654345678765434----------------------------------------------------------------');
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) => DetailPage(
                                                index: index,
                                              ),
                                            ));
                                          },
                                          child: Text(
                                            planetData.name,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: height * 0.32,
                          ),
                          IconButton(
                            onPressed: _scrollRight,
                            icon: Icon(Icons.arrow_forward_ios),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 10),
              child: Container(
                height: height * 0.07,
                width: width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white30,
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.explore,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookmarkScreen(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.bookmark,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
