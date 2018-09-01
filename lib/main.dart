import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/config/routes.dart';
import 'package:transport_for_london/enums/environment.dart';
import 'package:transport_for_london/injectors/dependency.dart';

void main() {
  DependencyInjector.environment = Environment.PROD;

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    final Router router = new Router();
    Routes.configureRoutes(router);
    App.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      onGenerateRoute: App.router.generator,
      supportedLocales: [const Locale('en', 'GB')],
      theme: new ThemeData.dark(),
      title: 'Transport for London',
    );
  }
}
