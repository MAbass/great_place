import 'package:flutter/material.dart';
import 'package:great_place/models/Place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return _items;
  }

}