import 'dart:async';

import 'package:flutter_flux/flutter_flux.dart';
import 'package:transport_for_london/models/stop_point.dart';

class StopPointStore extends Store {
  StopPointStore() {
    triggerOnAction(selectStopPoint, (stopPoint) {
      _stopPoint = stopPoint;
    });

    triggerOnAction(resetStopPoint, (_) {
      return new Future.delayed(
        new Duration(seconds: 1),
        () => _stopPoint = null,
      );
    });
  }

  StopPoint _stopPoint;

  StopPoint get stopPoint => _stopPoint;
}

final StoreToken stopPointStoreToken = new StoreToken(new StopPointStore());

final Action<StopPoint> selectStopPoint = new Action<StopPoint>();
final Action<void> resetStopPoint = new Action<void>();
