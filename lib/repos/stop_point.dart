import 'dart:async';

import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/models/stop_point.dart';

abstract class StopPointRepo {
  Future<List<Prediction>> getArrivalsByStopPointId(
    String stopPointId,
  );

  Future<StopPoint> getStopPointByStopPointId(
    String stopPointId,
  );

  Future<List<StopPoint>> getStopPointsByModeName(
    String modeName,
  );

  Future<List<StopPoint>> getStopPointsByType(
    String type,
  );
}
