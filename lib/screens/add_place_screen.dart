import 'package:flutter/material.dart';
import 'package:places_app/widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);
  static const String routename = "/AddPlaceScreen";

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  //final _form=GlobalKey<FormState>();
  final _titleController = TextEditingController();

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
                ImageInput(),
              ],
            ),
          ),
        )),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.secondary)),
          onPressed: () {},
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
