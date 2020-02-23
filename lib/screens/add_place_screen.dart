import 'dart:io';

import 'package:cr_fav_places/models/place.dart';
import 'package:cr_fav_places/providers/great_places_provider.dart';
import 'package:cr_fav_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {

  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
   _pickedImage = pickedImage;
  }

  void _savePlace() {
    if(_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlacesProvider>(context, listen: false).addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _titleController,

                      decoration: InputDecoration(
                        labelText: 'Title'
                      ),
                    ),
                    SizedBox(height: 10,),
                    ImageInput(_selectImage),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add place'),
            onPressed: _savePlace,
            elevation: 0.0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }
}

