import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../widgets/image_input.dart';
import '../provider/plces_list.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);
  static const String routename = "/AddPlaceScreen";

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  //final _form=GlobalKey<FormState>();
  final _titleController = TextEditingController();
  File? _image;

  void _selectImage(File pickedImage) {
    _image = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _image == null)
      return; //handling needed
    Provider.of<Places>(context, listen: false).addPlace(
      _titleController.text,
      _image!,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add great places"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                    decoration: InputDecoration(label: Text("Title")),
                    controller: _titleController),
                SizedBox(
                  height: 10,
                ),
                ImageInput(_selectImage),
              ],
            ),
          ),
        )),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.secondary)),
          onPressed: _savePlace,
          child: Text(
            "Submit",
            // style: TextStyle(
            //     backgroundColor: Theme.of(context).colorScheme.secondary),
          ),
        )
      ]),
    );
  }
}
