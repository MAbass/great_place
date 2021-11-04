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
}
