import 'dart:async';

import 'package:transport_for_london/mappings/line.dart';
import 'package:transport_for_london/mappings/stop_point.dart';
import 'package:transport_for_london/models/disruption.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/repos/http/http.dart';
import 'package:transport_for_london/repos/line.dart';

class HttpLineRepo extends Http implements LineRepo {
  @override
  Future<List<Disruption>> getDisruptionsByMode([
    String mode = 'tube',
  ]) async {
    return mapToDisruptions(
      await get('/Line/Mode/$mode/Disruption'),
    );
  }

  @override
  Future<Line> getLineByLineId(
    String lineId,
  ) async {
    return mapToLine(
      ((await get('/Line/$lineId')) as List).first,
    );
  }

  @override
  Future<List<Line>> getLinesByMode([
    String mode = 'tube',
  ]) async {
    return mapToLines(
      await get('/Line/Mode/$mode'),
    );
  }

  @override
  Future<List<LineStatus>> getLineStatusesByLineId(
    String lineId,
  ) async {
    return mapToLineStatuses(
      ((await get('/Line/$lineId/Status')) as List).first,
    );
  }

  @override
  Future<List<LineStatus>> getLineStatusesByLineIdDate(
    String lineId,
    DateTime fromDate,
    DateTime toDate,
  ) async {
    return mapToLineStatuses(
      await get(
        '/Line/$lineId/Status/${fromDate.toUtc().toIso8601String().substring(0, 10)}/to/${toDate.toUtc().toIso8601String().substring(0, 10)}',
      ),
    );
  }

  @override
  Future<List<StopPoint>> getStopPointsByLineId(
    String lineId,
  ) async {
    return mapToStopPoints(
      await get('/Line/$lineId/StopPoints'),
    );
  }
}
