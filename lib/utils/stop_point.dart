import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/models/stop_point.dart';

bool doesStopPointCommonNameContainQuery(StopPoint stopPoint, String query) {
  return stopPoint.commonName.contains(new RegExp(query, caseSensitive: false));
}

int sortPredictions(Prediction a, Prediction b) {
  if (a.platformName == b.platformName && a.lineName == b.lineName) {
    return a.expectedArrival.compareTo(b.expectedArrival);
  } else if (a.lineName == b.lineName) {
    return a.platformName.compareTo(b.platformName);
  } else {
    return a.lineName.compareTo(b.lineName);
  }
}

int sortStopPoints(StopPoint a, StopPoint b) {
  return a.commonName.compareTo(b.commonName);
}
