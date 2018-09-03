import 'package:flutter_flux/flutter_flux.dart';
import 'package:transport_for_london/models/stop_point.dart';

class StopPointStore extends Store {
  StopPointStore() {
    triggerOnAction(selectStopPoint, (stopPoint) {
      _stopPoint = stopPoint;
    });
  }

  StopPoint _stopPoint;

  StopPoint get stopPoint => _stopPoint;
}

final StoreToken stopPointStoreToken = StoreToken(StopPointStore());

final Action<StopPoint> selectStopPoint = Action<StopPoint>();
