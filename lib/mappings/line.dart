import 'package:transport_for_london/models/disruption.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/models/line_status.dart';

Disruption mapToDisruption(dynamic value) {
  return Disruption.fromJson(value);
}

List<Disruption> mapToDisruptions(List<dynamic> values) {
  return values.map(mapToDisruption).toList();
}

Line mapToLine(dynamic value) {
  return Line.fromJson(value);
}

List<LineStatus> mapToLineStatuses(dynamic value) {
  return new Line.fromJson(value).lineStatuses;
}

List<Line> mapToLines(List<dynamic> values) {
  return values.map(mapToLine).toList();
}
