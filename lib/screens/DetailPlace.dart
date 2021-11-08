import 'package:flutter/material.dart';

class PlaceDetail extends StatelessWidget {
  static String routeName = 'place-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place detail"),
      ),
      body: Center(
        child: Text("Place for detail "),
      ),
    );
  }
}
