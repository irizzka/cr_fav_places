import 'package:cr_fav_places/models/place.dart';
import 'package:cr_fav_places/providers/great_places_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/details';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final Place selectedPlace = Provider.of<GreatPlacesProvider>(context, listen: false).getItem(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
              height: 300.0,
              width: double.infinity,
              child: Image.file(selectedPlace.image, fit: BoxFit.cover,),
          ),
          SizedBox(height: 10.0,),
          Text(selectedPlace.id),
        ],
      ),
    );
  }
}
