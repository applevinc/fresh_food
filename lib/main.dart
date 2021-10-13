import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fresh_food_ui/src/app.dart';
import 'package:fresh_food_ui/src/locator.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarBrightness: Brightness.dark,
    // ));

    di.init();
    runApp(MyApp());
  });
}
