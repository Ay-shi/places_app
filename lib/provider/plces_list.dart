import 'package:flutter/material.dart';
import '/models/place.dart';
import 'dart:io';

class Places with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return _places;
  }

  void addPlace(String placeTitle, File placeImage) {
    _places.add(Place(
        title: placeTitle,
        image: placeImage,
        id: DateTime.now().toString(),
        location: null));
    notifyListeners();
  }
}
