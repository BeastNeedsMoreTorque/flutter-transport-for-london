import 'package:transport_for_london/models/disruption.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/models/matched_route.dart';
import 'package:transport_for_london/models/mode.dart';

Disruption mapToDisruption(dynamic value) {
  return Disruption.fromJson(value);
}

List<Disruption> mapToDisruptions(List<dynamic> values) {
  return values.map(mapToDisruption).toList();
}

Line mapToLine(dynamic value) {
  return Line.fromJson(value);
}

List<Line> mapToLines(List<dynamic> values) {
  return values.map(mapToLine).toList();
}

Mode mapToMode(dynamic value) {
  return Mode.fromJson(value);
}

List<Mode> mapToModes(List<dynamic> values) {
  return values.map(mapToMode).toList();
}

MatchedRoute mapToRoute(dynamic value) {
  return MatchedRoute.fromJson(value);
}

List<MatchedRoute> mapToRoutes(List<dynamic> values) {
  return values.map(mapToRoute).toList();
}

List<LineStatus> mapToStatuses(dynamic value) {
  return mapToLine(value).lineStatuses;
}
