import 'package:cr_fav_places/providers/great_places_provider.dart';
import 'package:cr_fav_places/screens/add_place_screen.dart';
import 'package:cr_fav_places/screens/place_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your places'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
            )
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<GreatPlacesProvider>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<GreatPlacesProvider>(
                  child: Center(
                    child: const Text('Got no places yet, start adding some'),
                  ),
                  builder: (ctx, greatPlaces, child) =>
                      greatPlaces.items.length <= 0
                          ? child
                          : ListView.builder(
                              itemCount: greatPlaces.items.length,
                              itemBuilder: (ctx, index) => ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: FileImage(
                                          greatPlaces.items[index].image),
                                    ),
                                    title: Text(greatPlaces.items[index].title),
                                    onTap: () {
                                      Navigator.of(context).pushNamed(PlaceDetailScreen.routeName, arguments: greatPlaces.items[index].id);
                                     // Navigator.of(context).pop();
                                    },
                                  )),
                ),
        ));
  }
}
