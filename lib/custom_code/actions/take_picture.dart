// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';

// Define a custom action that takes a picture using the camera, uploads it to Firebase, and returns the Firebase path
Future<String?> takePicture() async {
// Get the list of available cameras on the device
  CameraDescription? frontCamera = null;

  try {
// Get the list of available cameras on the device
    final cameras = await availableCameras();

// Get the front-facing camera from the list
    frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
    );
  } on StateError {
// Handle the case where no front-facing camera is available
  }

// Create a camera controller
  final controller = CameraController(
    frontCamera!,
// Define the resolution to use.
    ResolutionPreset.high,
  );

// Initialize the controller
  await controller.initialize();

// Take a picture using the camera controller
  final image = await controller.takePicture();

// Dispose the controller when not needed anymore
  await controller.dispose();

// Upload the image to Firebase
  final ref = FirebaseStorage.instance.ref().child('images/image.jpg');
  await ref.putFile(File(image.path));

// Return the Firebase path
  return await ref.getDownloadURL();
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
