import 'dart:async';

import 'package:transport_for_london/models/disruption.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/models/matched_route.dart';
import 'package:transport_for_london/models/mode.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/repos/line.dart';

class MockLineRepo implements LineRepo {
  @override
  Future<List<Disruption>> getDisruptionsByModeName(
    String modeName,
  ) {
    // TODO: implement getDisruptionsByMode
  }

  @override
  Future<Line> getLineByLineId(
    String lineId,
  ) {
    // TODO: implement getLineByLineId
  }

  @override
  Future<List<Mode>> getLineModes() {
    // TODO: implement getLineModes
  }

  @override
  Future<List<MatchedRoute>> getRoutesByLineId(
    String lineId,
  ) {
    // TODO: implement getLineRoutesByLineId
  }

  @override
  Future<List<LineStatus>> getStatusesByLineId(
    String lineId,
  ) {
    // TODO: implement getLineStatusesByLineId
  }

  @override
  Future<List<LineStatus>> getStatusesByLineIdDate(
    String lineId,
    DateTime fromDate,
    DateTime toDate,
  ) {
    // TODO: implement getLineStatusesByLineIdDate
  }

  @override
  Future<List<Line>> getLinesByModeName(
    String modeName,
  ) {
    // TODO: implement getLinesByMode
  }

  @override
  Future<List<StopPoint>> getStopPointsByLineId(
    String lineId,
  ) {
    // TODO: implement getStopPointsByLineId
  }
}
