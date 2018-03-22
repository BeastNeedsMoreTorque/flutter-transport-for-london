import 'package:flutter/material.dart';
import 'package:transport_for_london/pages/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(),
      theme: new ThemeData.dark(),
      title: 'Transport for London',
    );
  }
}
