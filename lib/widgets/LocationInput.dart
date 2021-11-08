import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _previewImageUrl;
    Future<void> getUserLocation() async {
      final location = await Location().getLocation();
      print("Latitude: ${location.latitude}");
      print("Longitude: ${location.longitude}");
    }

    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          child: _previewImageUrl == null
              ? Text(
                  "No image to preview",
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FlatButton.icon(
              onPressed: getUserLocation,
              icon: Icon(Icons.location_on),
              label: Text("Current location"),
              textColor: Theme.of(context).primaryColor,
            ),
            FlatButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text("Select on map"),
              textColor: Theme.of(context).primaryColor,
            ),
          ],
        )
      ],
    );
  }
}
