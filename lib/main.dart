import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh Food UI',
      home: Scaffold(
        body: Center(
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
