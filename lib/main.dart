import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/config/routes.dart';
import 'package:transport_for_london/enums/environment.dart';
import 'package:transport_for_london/locators/service.dart';

void main() {
  ServiceLocator.environment = Environment.PROD;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    final Router router = Router();
    Routes.configureRoutes(router);
    App.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: App.router.generator,
      supportedLocales: [const Locale('en', 'GB')],
      theme: ThemeData.dark(),
      title: 'Transport for London',
    );
  }
}
