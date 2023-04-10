import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBVLzr2AxBMUz5AKl15NLJw7LozOSqK6_s",
            authDomain: "mekaapp-af802.firebaseapp.com",
            projectId: "mekaapp-af802",
            storageBucket: "mekaapp-af802.appspot.com",
            messagingSenderId: "319100357057",
            appId: "1:319100357057:web:9d7c3a04bfbea7b72c4740",
            measurementId: "G-H66ZSYCDRE"));
  } else {
    await Firebase.initializeApp();
  }
}
