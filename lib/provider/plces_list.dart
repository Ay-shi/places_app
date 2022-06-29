import 'package:flutter/material.dart';
import '/models/place.dart';
import '/helpers/db_helper.dart';
import 'dart:io';

class Places with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return _places;
  }

  void addPlace(String placeTitle, File placeImage) {
    final id = DateTime.now().toString();
    _places.add(
        Place(title: placeTitle, image: placeImage, id: id, location: null));
    notifyListeners();
    DBHelper.insert('user_places',
        {"title": placeTitle, "id": id, "image": placeImage.path});
  }

  Future<void> fetchAndSetPlace() async {
    final loadedPlaces = await DBHelper.getData("user_places");
    _places = loadedPlaces
        .map((item) => Place(
            id: item["id"] as String,
            title: item["title"] as String,
            location: null,
            image: File(item["image"] as String)))
        .toList();

    notifyListeners();
  }
}
