import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fresh_food_ui/src/app.dart';
import 'package:fresh_food_ui/src/locator.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);

    di.init();
    runApp(MyApp());
  });
}
