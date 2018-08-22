import 'dart:async';

import 'package:transport_for_london/models/disruption.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/repos/line.dart';

class MockLineRepo implements LineRepo {
  @override
  Future<List<Disruption>> getDisruptionsByMode([
    String mode = 'tube',
  ]) {
    // TODO: implement getDisruptionsByMode
  }

  @override
  Future<Line> getLineByLineId(
    String lineId,
  ) {
    // TODO: implement getLineByLineId
  }

  @override
  Future<List<LineStatus>> getLineStatusesByLineId(
    String lineId,
  ) {
    // TODO: implement getLineStatusesByLineId
  }

  @override
  Future<List<LineStatus>> getLineStatusesByLineIdDate(
    String lineId,
    DateTime fromDate,
    DateTime toDate,
  ) {
    // TODO: implement getLineStatusesByLineIdDate
  }

  @override
  Future<List<Line>> getLinesByMode([
    String mode = 'tube',
  ]) {
    // TODO: implement getLinesByMode
  }

  @override
  Future<List<StopPoint>> getStopPointsByLineId(
    String lineId,
  ) {
    // TODO: implement getStopPointsByLineId
  }
}
