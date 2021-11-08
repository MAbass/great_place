import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_place/helpers/DBHelper.dart';
import 'package:great_place/models/Place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return _items;
  }

  void addPlace(String title, File pickedImage) {
    final newPlace = Place(DateTime.now().toString(), title, null, pickedImage);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert("user_places", {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData("user_places");
    _items = dataList
        .map((item) =>
            Place(item['id'], item['title'], null, File(item['image'])))
        .toList();
    print('Data list: ${dataList}');
    notifyListeners();
  }
}
