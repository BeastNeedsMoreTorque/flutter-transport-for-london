import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:transport_for_london/models/configuration.dart';
import 'package:transport_for_london/models/favourite.dart';

class PreferenceService {
  final String _favourites = 'favourites';
  final String _configuration = 'configuration';

  Future<List<Favourite>> getFavourites() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String string = preferences.getString(_favourites);
    List<Favourite> favourites = [];

    string == null
        ? await setFavourites(favourites)
        : favourites = (json.decode(string) as List)
            .map((value) => Favourite.fromJson(value))
            .toList();

    return favourites;
  }

  Future<void> setFavourites(List<Favourite> favourites) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_favourites, json.encode(favourites));
  }

  Future<Configuration> getConfiguration() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String string = preferences.getString(_configuration);
    Configuration configuration = Configuration();

    string == null
        ? await setConfiguration(configuration)
        : configuration = Configuration.fromJson(json.decode(string));

    return configuration;
  }

  Future<void> setConfiguration(Configuration configuration) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_configuration, json.encode(configuration));
  }
}
