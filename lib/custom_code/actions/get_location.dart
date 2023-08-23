// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart';

Future<String> getLocation() async {
  try {
    final location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final latitude = location.latitude;
    final longitude = location.longitude;
    final url = 'https://www.google.com/maps/?q=$latitude,$longitude';
    return url;
  } catch (e) {
    print(e);
    return "Cannot get location";
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
