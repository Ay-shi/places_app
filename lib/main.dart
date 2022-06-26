import 'package:flutter/material.dart';
import 'package:places_app/provider/plces_list.dart';
import 'package:places_app/screens/add_place_screen.dart';
import './screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Places(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            colorScheme: ColorScheme.fromSwatch(accentColor: Colors.amber)),
        home: PLaceListScreen(),
        routes: {
          AddPlaceScreen.routename: (ctx) => AddPlaceScreen(),
        },
      ),
    );
  }
}
