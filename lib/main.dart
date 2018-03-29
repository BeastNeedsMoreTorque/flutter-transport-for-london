import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transport_for_london/models/configuration.dart';
import 'package:transport_for_london/pages/additional_properties.dart';
import 'package:transport_for_london/pages/disruptions.dart';
import 'package:transport_for_london/pages/home.dart';
import 'package:transport_for_london/pages/line_statuses.dart';
import 'package:transport_for_london/pages/lines.dart';
import 'package:transport_for_london/pages/predictions.dart';
import 'package:transport_for_london/pages/settings.dart';
import 'package:transport_for_london/pages/stop_points.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

void main() {
  runApp(
    new FutureBuilder<SharedPreferences>(
      builder: (
        BuildContext context,
        AsyncSnapshot<SharedPreferences> snapshot,
      ) {
        return snapshot.hasData ? new MyApp(snapshot.data) : new SplashScreen();
      },
      future: SharedPreferences.getInstance(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp(this.preferences);

  final SharedPreferences preferences;

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Configuration get _configuration {
    if (widget.preferences.getString('configuration') == null) {
      Configuration configuration = new Configuration();

      _configurationUpdater(configuration);

      return configuration;
    } else {
      return new Configuration.fromJson(
        JSON.decode(
          widget.preferences.getString('configuration'),
        ),
      );
    }
  }

  void _configurationUpdater(Configuration configuration) {
    setState(() {
      widget.preferences.setString(
        'configuration',
        JSON.encode(configuration),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(_configuration),
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
        '/settings': (_) {
          return new SettingsPage(
            _configuration,
            _configurationUpdater,
          );
        },
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

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoadingSpinnerWidget(),
    );
  }
}
