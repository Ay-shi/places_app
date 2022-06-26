import 'package:flutter/material.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _image;
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
                onPressed: () {},
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
