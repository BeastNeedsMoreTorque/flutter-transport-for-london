import 'package:flutter/material.dart';
import 'package:transport_for_london/pages/home.dart';
import 'package:transport_for_london/pages/lines.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        '/lines': (BuildContext context) => new LinesPage(),
      },
      theme: new ThemeData.dark(),
      title: 'Transport for London',
    );
  }
}
