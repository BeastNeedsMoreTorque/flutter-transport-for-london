import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:transport_for_london/pages/additional_properties.dart';
import 'package:transport_for_london/pages/disruptions.dart';
import 'package:transport_for_london/pages/home.dart';
import 'package:transport_for_london/pages/line_statuses.dart';
import 'package:transport_for_london/pages/lines.dart';
import 'package:transport_for_london/pages/predictions.dart';
import 'package:transport_for_london/pages/stop_points.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      routes: <String, WidgetBuilder>{
        '/additional_properties': (_) => new AdditionalPropertiesPage(),
        '/disruptions': (_) => new DisruptionsPage(),
        '/line_statuses': (_) => new LineStatusesPage(),
        '/lines': (_) => new LinesPage(),
        '/predictions': (_) => new PredictionsPage(),
        '/stop_points': (_) => new StopPointsPage(),
      },
      supportedLocales: [
        const Locale('en', 'GB'),
      ],
      theme: new ThemeData.dark(),
      title: 'Transport for London',
    );
  }
}
