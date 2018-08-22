import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:transport_for_london/models/configuration.dart';

class PreferencesService {
  final String _configuration = 'configuration';

  Future<Configuration> getConfiguration() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String string = preferences.getString(_configuration);
    Configuration configuration = new Configuration();

    string == null
        ? await setConfiguration(configuration)
        : configuration = new Configuration.fromJson(json.decode(string));

    return configuration;
  }

  Future<void> setConfiguration(Configuration configuration) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_configuration, json.encode(configuration));
  }
}
