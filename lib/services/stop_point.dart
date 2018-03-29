import 'dart:async';

import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/http.dart';
import 'package:transport_for_london/types/predicate.dart';

class StopPointService {
  final HttpService _httpService = new HttpService();

  Future<List<Prediction>> getPredictionsByStopPoint(String stopPoint) async {
    return await _httpService
        .get<List<Map<String, dynamic>>>('/StopPoint/$stopPoint/Arrivals')
        .then(_mapToPredictions);
  }

  Future<List<StopPoint>> getStopPointsByTypeMode([
    String type = 'NaptanMetroStation',
    String mode = 'tube',
  ]) async {
    Predicate<StopPoint> modePredicate = (stopPoint) {
      return stopPoint.modes.contains(mode);
    };

    return await _httpService
        .get<List<Map<String, dynamic>>>('/StopPoint/Type/$type')
        .then(_mapToStopPoints)
        .then((stopPoints) => stopPoints.where(modePredicate).toList());
  }

  List<Prediction> _mapToPredictions(
    List<Map<String, dynamic>> values,
  ) {
    List<Prediction> predictions = values.map((value) {
      return new Prediction.fromJson(value);
    }).toList();

    predictions.sort(_sortPredictions);

    return predictions;
  }

  List<StopPoint> _mapToStopPoints(
    List<Map<String, dynamic>> values,
  ) {
    List<StopPoint> stopPoints = values.map((value) {
      return new StopPoint.fromJson(value);
    }).toList();

    stopPoints.sort(_sortStopPoints);

    return stopPoints;
  }

  int _sortPredictions(Prediction a, Prediction b) {
    if (a.platformName == b.platformName && a.lineName == b.lineName) {
      return a.expectedArrival.compareTo(b.expectedArrival);
    } else if (a.lineName == b.lineName) {
      return a.platformName.compareTo(b.platformName);
    } else {
      return a.lineName.compareTo(b.lineName);
    }
  }

  int _sortStopPoints(StopPoint a, StopPoint b) {
    return a.commonName.compareTo(b.commonName);
  }
}
