import 'dart:async';

import 'package:transport_for_london/mappings/line.dart';
import 'package:transport_for_london/mappings/stop_point.dart';
import 'package:transport_for_london/models/disruption.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/models/matched_route.dart';
import 'package:transport_for_london/models/mode.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/io/http.dart';
import 'package:transport_for_london/repos/line.dart';

class ProdLineRepo implements LineRepo {
  ProdLineRepo(this._http);

  final AppHttp _http;

  @override
  Future<List<Disruption>> getDisruptionsByModeName(
    String modeName,
  ) async {
    return mapToDisruptions(
      await _http.get('/Line/Mode/$modeName/Disruption'),
    );
  }

  @override
  Future<Line> getLineByLineId(
    String lineId,
  ) async {
    return mapToLine(
      ((await _http.get(
        '/Line/$lineId',
      )) as List)
          .first,
    );
  }

  @override
  Future<List<Mode>> getLineModes() async {
    return mapToModes(
      await _http.get('/Line/Meta/Modes'),
    );
  }

  @override
  Future<List<MatchedRoute>> getRoutesByLineId(
    String lineId,
  ) async {
    return mapToRoutes(
      (mapToLine(
        await _http.get('/Line/${lineId}/Route'),
      ))
          .routeSections,
    );
  }

  @override
  Future<List<LineStatus>> getStatusesByLineId(
    String lineId,
  ) async {
    return mapToStatuses(
      ((await _http.get(
        '/Line/$lineId/Status',
      )) as List)
          .first,
    );
  }

  @override
  Future<List<LineStatus>> getStatusesByLineIdDate(
    String lineId,
    DateTime fromDate,
    DateTime toDate,
  ) async {
    return mapToStatuses(
      (await _http.get(
        '/Line/$lineId/Status/${fromDate.toIso8601String().substring(0, 10)}/to/${toDate.toIso8601String().substring(0, 10)}',
      ) as List)
          .first,
    );
  }

  @override
  Future<List<Line>> getLinesByModeName(
    String modeName,
  ) async {
    return mapToLines(
      await _http.get('/Line/Mode/$modeName'),
    );
  }

  @override
  Future<List<StopPoint>> getStopPointsByLineId(
    String lineId,
  ) async {
    return mapToStopPoints(
      await _http.get('/Line/$lineId/StopPoints'),
    );
  }
}
