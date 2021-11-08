import 'package:flutter/material.dart';
import 'package:great_place/providers/GreatPlaces.dart';
import 'package:great_place/screens/AddPlace.dart';
import 'package:great_place/screens/DetailPlace.dart';
import 'package:provider/provider.dart';

class ListPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future _fetchAllPlaces;
    Future setPlaces() {
      _fetchAllPlaces =
          Provider.of<GreatPlaces>(context, listen: false).fetchAndSetPlaces();
      print('Set the future builder for fetching all places!!');
      return _fetchAllPlaces;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Places"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
          future: setPlaces(),
          builder: (ctx, snapshot) {
            if (snapshot.error != null) {
              return Center(
                child: Text("An error is occured"),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Consumer<GreatPlaces>(
                builder: (ctx, greatPlaces, child) {
                  if (greatPlaces.items.length <= 0) {
                    return child;
                  }
                  return ListView.builder(
                      itemCount: greatPlaces.items.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                            FileImage(greatPlaces.items[index].image),
                          ),
                          title: Text(greatPlaces.items[index].title),
                          onTap: () {
                            // go to the detail
                            Navigator.pushNamed(context, PlaceDetail.routeName);
                          },
                        );
                      });
                },
                child: Center(
                  child: Text("Got not places yey"),
                ),
              );
            }
          }),
    );
  }
}
