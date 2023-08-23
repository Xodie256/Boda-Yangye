// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> safeMessage() async {
  String displayName = '';
  await FirebaseFirestore.instance
      .collection("users")
      .get()
      .then((querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      displayName = doc.data()["displayName"];
    });
  });
  return "It's" + displayName + ", I am alright! But call me to be sure!";
}
