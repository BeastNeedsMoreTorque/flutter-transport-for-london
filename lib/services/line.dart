import 'dart:async';

import 'package:transport_for_london/models/disruption.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/http.dart';

class LineService {
  final HttpService _httpService = new HttpService();

  Future<List<Disruption>> getDisruptionsByMode([String mode = 'tube']) async {
    return await _httpService
        .get<List<Map<String, dynamic>>>('/Line/Mode/$mode/Disruption')
        .then(_mapToDisruptions);
  }

  Future<List<Line>> getLinesByMode([String mode = 'tube']) async {
    return await _httpService
        .get<List<Map<String, dynamic>>>('/Line/Mode/$mode')
        .then(_mapToLines);
  }

  Future<List<LineStatus>> getLineStatusesByLine(String line) async {
    return await _httpService
        .get<List<Map<String, dynamic>>>('/Line/$line/Status')
        .then(_mapToLineStatuses);
  }

  Future<List<StopPoint>> getStopPointsByLine(String line) async {
    return await _httpService
        .get<List<Map<String, dynamic>>>('/Line/$line/StopPoints')
        .then(_mapToStopPoints);
  }

  List<Disruption> _mapToDisruptions(
    List<Map<String, dynamic>> disruptions,
  ) {
    return disruptions.map((disruption) {
      return new Disruption.fromJson(disruption);
    }).toList();
  }

  List<LineStatus> _mapToLineStatuses(
    List<Map<String, dynamic>> lines,
  ) {
    return new Line.fromJson(lines[0]).lineStatuses;
  }

  List<Line> _mapToLines(
    List<Map<String, dynamic>> lines,
  ) {
    return lines.map((line) {
      return new Line.fromJson(line);
    }).toList();
  }

  List<StopPoint> _mapToStopPoints(
    List<Map<String, dynamic>> stopPoints,
  ) {
    return stopPoints.map((stopPoint) {
      return new StopPoint.fromJson(stopPoint);
    }).toList();
  }
}
