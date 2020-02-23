import 'dart:io';

import 'package:cr_fav_places/models/place.dart';
import 'package:flutter/cupertino.dart';
import '../helpers/db_helper.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Place getItem(String id){
    return _items.firstWhere((el)=> el.id == id);
  }

  void addPlace(String pickedTitle, File pickedImage) {
    Place newPlace = Place(id: DateTime.now().toString(),
    image: pickedImage,
    title: pickedTitle,
      location: null,
    );
    _items.add(newPlace);
    notifyListeners();

    DBHelper.insert('user_places', {
      'id' : newPlace.id,
      'title' : newPlace.title,
      'image' : newPlace.image.path,
    });
  }


  Future<void> fetchAndSetPlaces() async{
    final dataList = await DBHelper.getData('user_places');
    _items = dataList.map((el) => Place(
      id : el['id'],
      title : el['title'],
      image : File(el['image']),
      location: null,
    )).toList();
    notifyListeners();
  }
}