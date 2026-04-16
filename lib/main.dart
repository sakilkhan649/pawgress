import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pawgress/app.dart';



void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // // Initialize Firebase
  // await Firebase.initializeApp();
  //
  // // Initialize Firebase Messaging
  // await FirebaseNotificationService.initialize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

