import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_app/provider/space_provider.dart';
import 'package:space_app/screen/screens/homeScreen.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => SpaceProvider(),)
      ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),

    );
  }
}