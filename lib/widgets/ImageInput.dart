import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  final Function onselectImage;

  ImageInput(this.onselectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    print("Picker image");
    final pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 600);
    File imageFile = File(pickedFile.path);
    setState(() {
      _storedImage = File(imageFile.path);
    });
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy("${appDir.path}/$fileName");
    // print('Saved image:${savedImage}');
    widget.onselectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 140,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text("Image doesn't exist"),
        ),
        SizedBox(
          width: 60,
        ),
        FlatButton.icon(
          onPressed: _takePicture,
          icon: Icon(Icons.camera),
          label: Text("Take a picture"),
          textColor: Theme.of(context).primaryColor,
        )
      ],
    );
  }
}
