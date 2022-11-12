import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fresh_food_ui/src/app.dart';
import 'package:fresh_food_ui/src/service_locator.dart' as serviceLocator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await serviceLocator.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    runApp(MyApp());
  });
}
