import 'dart:convert';

import 'package:flutter/cupertino.dart';
// import 'package:location/location.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class LocationServices {

  getCity() async {
    // Get the user's IP address.
    var ip = await http.get(Uri.parse('https://api.ipify.org'));
    // print(ip);
    var response = await http.get(Uri.parse('http://ip-api.com/json/${ip.body}'));

    // Get the city from the response.
    var city = jsonDecode(response.body);

    return city['city'];
  }

  // checkLocation() async {
  //   Location location = Location();
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _locationData;
  //   // print("Here");
  //
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     // print("Here 2");
  //     if (!_serviceEnabled) {
  //       // print("Here 3");
  //       return Future.error('Location services are disabled.');
  //     }
  //   }
  //   // print("Here 4");
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //
  //   location.changeSettings(accuracy: LocationAccuracy.low);
  //
  //   // print("Here 5" + _serviceEnabled.toString());
  //   _locationData = await location.getLocation();
  //   // print("Here 6");
  //   return _locationData;
  // }

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
