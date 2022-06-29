import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  //const ImageInput({Key? key}) : super(key: key);
  void Function(File) saveImage;
  ImageInput(this.saveImage);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _image;

  Future<void> takePicture() async {
    final _imagePicker = ImagePicker();
    final loadedImage =
        await _imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (loadedImage == null) return;
    setState(() {
      _image = File(loadedImage.path);
    });
    widget.saveImage(_image!);
    final imagePath = path.basename(loadedImage.path);
    final systemPath = await syspath.getApplicationDocumentsDirectory();
    final savedImage = await _image!.copy("${systemPath.path}/$imagePath");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor)),
          height: 100,
          width: 100,
          child: _image != null
              ? Image.file(
                  _image!,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text("no picture chosen"),
        ),
        SizedBox(width: 10),
        Expanded(
            child: TextButton.icon(
                onPressed: takePicture,
                icon: Icon(
                  Icons.camera,
                  color: Theme.of(context).primaryColor,
                ),
                label: Text(
                  "Click Photo",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )))
      ],
    );
  }
}
