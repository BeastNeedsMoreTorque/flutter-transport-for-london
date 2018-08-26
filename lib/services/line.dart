import 'dart:async';

import 'package:transport_for_london/models/disruption.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/models/matched_route.dart';
import 'package:transport_for_london/models/mode.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/repos/line.dart';
import 'package:transport_for_london/types/predicate.dart';

class LineService {
  LineService(this._lineRepo);

  final LineRepo _lineRepo;

  Future<List<Disruption>> getDisruptionsByModeName([
    String modeName = 'tube',
  ]) {
    return _lineRepo.getDisruptionsByModeName(
      modeName,
    );
  }

  Future<Line> getLineByLineId(
    String lineId,
  ) {
    return _lineRepo.getLineByLineId(
      lineId,
    );
  }

  Future<List<Mode>> getLineModes() async {
    Predicate<Mode> isTflServicePredicate = (mode) => mode.isTflService;

    return (await _lineRepo.getLineModes())
        .where(isTflServicePredicate)
        .toList();
  }

  Future<List<Line>> getLinesByModeName([
    String modeName = 'tube',
  ]) {
    return _lineRepo.getLinesByModeName(
      modeName,
    );
  }

  Future<List<MatchedRoute>> getRoutesByLineId(
    String lineId,
  ) {
    return _lineRepo.getRoutesByLineId(lineId);
  }

  Future<List<LineStatus>> getStatusesByLineId(
    String lineId,
  ) {
    return _lineRepo.getStatusesByLineId(
      lineId,
    );
  }

  Future<List<LineStatus>> getStatusesByLineIdDate(
    String lineId,
    DateTime fromDate,
    DateTime toDate,
  ) {
    return _lineRepo.getStatusesByLineIdDate(
      lineId,
      fromDate,
      toDate,
    );
  }

  Future<List<StopPoint>> getStopPointsByLineId(
    String lineId,
  ) {
    return _lineRepo.getStopPointsByLineId(
      lineId,
    );
  }
}
