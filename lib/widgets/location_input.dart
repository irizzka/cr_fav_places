import 'package:cr_fav_places/helpers/location_helper.dart';
import 'package:cr_fav_places/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async{
    final locData = await Location().getLocation();
   // print(locData.latitude);
   // print(locData.longitude);
   // final staticMapImageUrl = LocationHelper.locationPreviewImage(latitude: locData.latitude, longitude: locData.longitude);

  setState(() {
   // _previewImageUrl = staticMapImageUrl;
  });
  }

  Future<void> _selectOnMap() async{
   final selectedLocation = await Navigator.of(context).push(MaterialPageRoute(
       fullscreenDialog: true,
       builder: (context) => MapScreen(isSelecting: true,)));
   if(selectedLocation == null){
     return;
   }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey)
          ),
          child: _previewImageUrl == null
              ? Text('No location chosen')
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Current location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _getCurrentUserLocation,
            ),
            FlatButton.icon(
              icon: Icon(Icons.map),
              label: Text('Select on Map'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _selectOnMap,
            ),
          ],
        )
      ],
    );
  }
}
