import 'dart:async';

import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/repos/stop_point.dart';
import 'package:transport_for_london/types/predicate.dart';

class StopPointService {
  StopPointService(this.stopPointRepo);

  final StopPointRepo stopPointRepo;

  Future<Prediction> getArrivalByStopPointIdArrivalId(
    String stopPointId,
    String arrivalId,
  ) async {
    Predicate<Prediction> arrivalIdPredicate = (prediction) {
      return prediction.id == arrivalId;
    };

    return (await getArrivalsByStopPointId(stopPointId))
        .where(arrivalIdPredicate)
        .first;
  }

  Future<List<Prediction>> getArrivalsByStopPointId(
    String stopPointId,
  ) {
    return stopPointRepo.getArrivalsByStopPointId(
      stopPointId,
    );
  }

  Future<StopPoint> getStopPointByStopPointId(
    String stopPointId,
  ) {
    return stopPointRepo.getStopPointByStopPointId(
      stopPointId,
    );
  }

  Future<List<StopPoint>> getStopPointsByType([
    String type = 'NaptanMetroStation',
  ]) {
    return stopPointRepo.getStopPointsByType(type);
  }

  Future<List<StopPoint>> getStopPointsByTypeMode([
    String type = 'NaptanMetroStation',
    String mode = 'tube',
  ]) async {
    Predicate<StopPoint> modePredicate = (stopPoint) {
      return stopPoint.modes.contains(mode);
    };

    return (await getStopPointsByType(type)).where(modePredicate).toList();
  }
}
