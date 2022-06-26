import 'package:flutter/material.dart';

class PLaceListScreen extends StatelessWidget {
  const PLaceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Great Places"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/AddPlaceScreen");
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
