import 'dart:async';

import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/repos/stop_point.dart';

class MockStopPointRepo implements StopPointRepo {
  @override
  Future<List<Prediction>> getArrivalsByStopPointId(
    String stopPointId,
  ) {
    // TODO: implement getPredictionsByStopPointId
  }

  @override
  Future<StopPoint> getStopPointByStopPointId(
    String stopPointId,
  ) {
    // TODO: implement getStopPointByStopPointId
  }

  @override
  Future<List<StopPoint>> getStopPointsByModeName(
    String modeName,
  ) {
    // TODO: implement getStopPointsByModeName
  }

  @override
  Future<List<StopPoint>> getStopPointsByType(
    String type,
  ) {
    // TODO: implement getStopPointsByType
  }
}
