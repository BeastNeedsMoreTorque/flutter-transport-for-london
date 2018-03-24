import 'dart:async';

import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/http.dart';

class LineService {
  final HttpService _httpService = new HttpService();

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

  List<LineStatus> _mapToLineStatuses(
    List<Map<String, dynamic>> lineStatuses,
  ) {
    return lineStatuses.map((lineStatus) {
      return new LineStatus.fromJson(lineStatus);
    }).toList();
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
