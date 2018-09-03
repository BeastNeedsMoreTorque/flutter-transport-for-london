import 'package:flutter_flux/flutter_flux.dart';

class ConfigurationStore extends Store {
  ConfigurationStore() {
    triggerOnAction(selectStopPointBeingEdited, (value) {
      _stopPointBeingEdited = value;
    });
  }

  String _stopPointBeingEdited;

  String get stopPointBeingEdited => _stopPointBeingEdited;
}

final StoreToken configurationStoreToken = StoreToken(ConfigurationStore());

final Action<String> selectStopPointBeingEdited = Action<String>();
