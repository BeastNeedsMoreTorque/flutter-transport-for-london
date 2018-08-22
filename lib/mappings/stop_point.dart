import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/utils/stop_point.dart';

Prediction mapToPrediction(dynamic value) {
  return Prediction.fromJson(value);
}

List<Prediction> mapToPredictions(List<dynamic> values) {
  List<Prediction> predictions = values.map(mapToPrediction).toList();

  predictions.sort(sortPredictions);

  return predictions;
}

StopPoint mapToStopPoint(dynamic value) {
  return StopPoint.fromJson(value);
}

List<StopPoint> mapToStopPoints(List<dynamic> values) {
  List<StopPoint> stopPoints = values.map(mapToStopPoint).toList();

  stopPoints.sort(sortStopPoints);

  return stopPoints;
}
