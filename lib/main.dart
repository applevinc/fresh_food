import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fresh_food_ui/src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(new MyApp());
  });
}
