import 'dart:io';

import 'package:flutter/cupertino.dart';

class PlaceLocation {
  double latitude;
  double longitude;
  String address;

  PlaceLocation(this.latitude, this.longitude, this.address);
}

class Place {
  String _id;
  String _title;
  PlaceLocation _location;
  File _image;

  Place(this._id, this._title, this._location, this._image);

  File get image => _image;

  set image(File value) {
    _image = value;
  }

  PlaceLocation get location => _location;

  set location(PlaceLocation value) {
    _location = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
