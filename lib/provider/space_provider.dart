import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../modal/modal.dart';


class SpaceProvider extends ChangeNotifier {
  List plantList = [];
  List<Planet> dataList = [];
  List<Planet> bookmarkedList = [];


  SpaceProvider() {
    jsonParsing();
    loadBookmarkedPlanets();
  }

  Future<void> jsonParsing() async {
    String? json = await rootBundle.loadString('assets/json/data.json');
    plantList = jsonDecode(json);

    dataList = plantList.map((e) => Planet.fromJson(e)).toList();
    notifyListeners();
  }

  Future<void> loadBookmarkedPlanets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? bookmarkedPlanets = prefs.getStringList('bookmarkedPlanets');

    if (bookmarkedPlanets != null) {
      bookmarkedList = dataList
          .where((planet) => bookmarkedPlanets.contains(planet.name))
          .toList();
      notifyListeners();
    }
  }

  Future<void> saveBookmarkedPlanets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> bookmarkedPlanets =
    bookmarkedList.map((planet) => planet.name).toList();
    await prefs.setStringList('bookmarkedPlanets', bookmarkedPlanets);
    notifyListeners();
  }

  void toggleBookmark(Planet planet) {
    if (bookmarkedList.contains(planet)) {
      bookmarkedList.remove(planet);
    } else {
      bookmarkedList.add(planet);
    }
    saveBookmarkedPlanets();
    notifyListeners();
  }
}

bool isBookmarked = false;
List bookMark = [
  isBookmarked = false,
  isBookmarked = false,
  isBookmarked = false,
  isBookmarked = false,
  isBookmarked = false,
  isBookmarked = false,
  isBookmarked = false,
  isBookmarked = false,
  isBookmarked = false,
];