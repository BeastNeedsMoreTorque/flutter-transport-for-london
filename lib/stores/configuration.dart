import 'dart:async';

import 'package:flutter_flux/flutter_flux.dart';

class ConfigurationStore extends Store {
  ConfigurationStore() {
    triggerOnAction(selectStopPointBeingEdited, (value) {
      _stopPointBeingEdited = value;
    });

    triggerOnAction(resetStopPointBeingEdited, (_) {
      return new Future.delayed(
        new Duration(seconds: 1),
        () => _stopPointBeingEdited = null,
      );
    });
  }

  String _stopPointBeingEdited;

  String get stopPointBeingEdited => _stopPointBeingEdited;
}

final StoreToken configurationStoreToken =
    new StoreToken(new ConfigurationStore());

final Action<String> selectStopPointBeingEdited = new Action<String>();
final Action<void> resetStopPointBeingEdited = new Action<void>();
