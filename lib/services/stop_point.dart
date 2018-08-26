import 'dart:async';

import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/repos/stop_point.dart';
import 'package:transport_for_london/types/predicate.dart';

class StopPointService {
  StopPointService(this._stopPointRepo);

  final StopPointRepo _stopPointRepo;

  Future<Prediction> getArrivalByStopPointIdArrivalId(
    String stopPointId,
    String arrivalId,
  ) async {
    Predicate<Prediction> arrivalIdPredicate = (prediction) {
      return prediction.id == arrivalId;
    };

    return (await getArrivalsByStopPointId(
      stopPointId,
    ))
        .where(arrivalIdPredicate)
        .first;
  }

  Future<List<Prediction>> getArrivalsByStopPointId(
    String stopPointId,
  ) {
    return _stopPointRepo.getArrivalsByStopPointId(
      stopPointId,
    );
  }

  Future<StopPoint> getStopPointByStopPointId(
    String stopPointId,
  ) {
    return _stopPointRepo.getStopPointByStopPointId(
      stopPointId,
    );
  }

  Future<List<StopPoint>> getStopPointsByModeName(
    String modeName,
  ) {
    return _stopPointRepo.getStopPointsByModeName(
      modeName,
    );
  }

  Future<List<StopPoint>> getStopPointsByType(
    String type,
  ) {
    return _stopPointRepo.getStopPointsByType(
      type,
    );
  }

  Future<List<StopPoint>> getStopPointsByTypeModeName([
    String type = 'NaptanMetroStation',
    String modeName = 'tube',
  ]) async {
    Predicate<StopPoint> modePredicate = (stopPoint) {
      return stopPoint.modes.contains(modeName);
    };

    return (await getStopPointsByType(
      type,
    ))
        .where(modePredicate)
        .toList();
  }
}
