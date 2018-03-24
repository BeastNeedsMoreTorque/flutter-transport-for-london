import 'package:flutter/material.dart';
import 'package:transport_for_london/pages/additional_properties.dart';
import 'package:transport_for_london/pages/home.dart';
import 'package:transport_for_london/pages/lines.dart';
import 'package:transport_for_london/pages/predictions.dart';
import 'package:transport_for_london/pages/stop_points.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        '/additional_properties': (BuildContext context) =>
            new AdditionalPropertiesPage(),
        '/lines': (BuildContext context) => new LinesPage(),
        '/predictions': (BuildContext context) => new PredictionsPage(),
        '/stop_points': (BuildContext context) => new StopPointsPage(),
      },
      theme: new ThemeData.dark(),
      title: 'Transport for London',
    );
  }
}
