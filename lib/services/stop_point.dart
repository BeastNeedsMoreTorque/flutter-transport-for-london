import 'dart:async';

import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/services/http.dart';

class StopPointService {
  final HttpService _httpService = new HttpService();

  Future<List<Prediction>> getPredictionsByStopPoint(String stopPoint) async {
    return await _httpService
        .get<List<Map<String, dynamic>>>('/StopPoint/$stopPoint/Arrivals')
        .then(_mapToPredictions);
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

  int _sortPredictions(Prediction a, Prediction b) {
    if (a.platformName == b.platformName && a.lineName == b.lineName) {
      return a.expectedArrival.compareTo(b.expectedArrival);
    } else if (a.lineName == b.lineName) {
      return a.platformName.compareTo(b.platformName);
    } else {
      return a.lineName.compareTo(b.lineName);
    }
  }
}
