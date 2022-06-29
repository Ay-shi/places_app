import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 200,
        child: _imageUrl == null
            ? Center(child: Text("No location available yet"))
            : Image.network(
                _imageUrl!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
        decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: Theme.of(context).primaryColor)),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.location_on),
              label: Text("Use current Location"),
              style: TextButton.styleFrom(
                  primary: Theme.of(context).primaryColor)),
          TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text("Mark on map"),
              style: TextButton.styleFrom(
                  primary: Theme.of(context).primaryColor)),
        ],
      )
    ]);
  }
}
