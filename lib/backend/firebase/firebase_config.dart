import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAWQeqXUXRhPVmmpnDjkVKXU03GDWC5rHU",
            authDomain: "bodayangye.firebaseapp.com",
            projectId: "bodayangye",
            storageBucket: "bodayangye.appspot.com",
            messagingSenderId: "793659504244",
            appId: "1:793659504244:web:5858cf9f147cb46b010321",
            measurementId: "G-BFLMZQGGK9"));
  } else {
    await Firebase.initializeApp();
  }
}
