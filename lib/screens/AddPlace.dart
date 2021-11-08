import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_place/providers/GreatPlaces.dart';
import 'package:great_place/widgets/ImageInput.dart';
import 'package:great_place/widgets/LocationInput.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static final routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    print("An image was selected");
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    print("Title: ${_titleController.text}");
    print("File to save: ${_pickedImage}");
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new place"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            // color: Colors.grey,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Title"),
                  controller: _titleController,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: ImageInput(_selectImage),
                ),
                SizedBox(
                  height: 10,
                ),
                LocationInput(),
              ],
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text("Add place"),
            onPressed: _savePlace,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
