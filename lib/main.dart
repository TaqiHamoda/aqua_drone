import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(),
    );
  }
}


class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Image.asset('images/legend.jpg', fit: BoxFit.contain,),
          Image.asset(
            'images/atlantic.jpg',
            height: 1200.0,
            width: 850.0,
          ),
        ],
      ),
    );
  }
}
