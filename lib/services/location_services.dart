import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

class LocationServices {
  Location location = Location();

  checkLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    debugPrintStack();

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {

      _serviceEnabled = await location.requestService();
      debugPrintStack();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    location.changeSettings(accuracy: LocationAccuracy.balanced);
    _locationData = await location.getLocation();
    return _locationData;
  }

  // getCity() async {
  //   final locationData = await LocationServices().checkLocation();
  //   List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
  //       locationData.latitude ?? 0.0,
  //       locationData.longitude ?? 0.0
  //   );
  //
  //   geo.Placemark place = placemarks[0];
  //   return place.locality;
  // }
}
