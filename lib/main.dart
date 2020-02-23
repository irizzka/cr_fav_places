import 'package:cr_fav_places/providers/great_places_provider.dart';
import 'package:cr_fav_places/screens/add_place_screen.dart';
import 'package:cr_fav_places/screens/place_detail_screen.dart';
import 'package:cr_fav_places/screens/places_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlacesProvider(),
      child: MaterialApp(
        title: 'Great places',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName : (context) => AddPlaceScreen(),
          PlaceDetailScreen.routeName : (context) => PlaceDetailScreen(),
        },
      ),
    );
  }
}


