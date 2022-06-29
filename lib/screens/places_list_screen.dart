import 'package:flutter/material.dart';
import 'package:places_app/provider/plces_list.dart';
import 'package:provider/provider.dart';

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
      body: FutureBuilder(
          future:
              Provider.of<Places>(context, listen: false).fetchAndSetPlace(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : Consumer<Places>(
                  builder: (ctx, places, ch) {
                    return Container(
                        child: places.places.isEmpty
                            ? ch
                            : ListView.builder(
                                itemCount: places.places.length,
                                itemBuilder: ((context, index) => ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: FileImage(
                                            places.places[index].image),
                                      ),
                                      title: Text(places.places[index].title),
                                      onTap: () {},
                                    ))));
                  },
                  child: const Center(
                      child: Text("No places have been added yet ;( ")),
                )),
    );
    //Center(child: CircularProgressIndicator()),
  }
}
