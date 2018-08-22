import 'dart:async';

import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/repos/stop_point.dart';
import 'package:transport_for_london/types/predicate.dart';

class StopPointService {
  StopPointService(this.stopPointRepo);

  final StopPointRepo stopPointRepo;

  Future<List<Prediction>> getPredictionsByStopPointId(
    String stopPointId,
  ) async {
    return stopPointRepo.getPredictionsByStopPointId(
      stopPointId,
    );
  }

  Future<StopPoint> getStopPointByStopPointId(
    String stopPointId,
  ) async {
    return stopPointRepo.getStopPointByStopPointId(
      stopPointId,
    );
  }

  Future<List<StopPoint>> getStopPointsByTypeMode([
    String type = 'NaptanMetroStation',
    String mode = 'tube',
  ]) async {
    Predicate<StopPoint> modePredicate = (stopPoint) {
      return stopPoint.modes.contains(mode);
    };

    return (await stopPointRepo.getStopPointsByType(type))
        .where(modePredicate)
        .toList();
  }
}
