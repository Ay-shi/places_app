import 'package:flutter/material.dart';
import 'dart:io';

class PlaceLocation {
  double latitude;
  double longitude;
  String? adress;
  PlaceLocation({required this.latitude, required this.longitude, this.adress});
}

class Place {
  String id;
  String title;
  PlaceLocation? location; //temp null
  File image;
  Place(
      {required this.id,
      required this.title,
      required this.location,
      required this.image});
}
