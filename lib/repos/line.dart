import 'dart:async';

import 'package:transport_for_london/models/disruption.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/models/matched_route.dart';
import 'package:transport_for_london/models/mode.dart';
import 'package:transport_for_london/models/stop_point.dart';

abstract class LineRepo {
  Future<List<Disruption>> getDisruptionsByModeName(
    String mode,
  );

  Future<Line> getLineByLineId(
    String lineId,
  );

  Future<List<Mode>> getLineModes();

  Future<List<Line>> getLinesByModeName(
    String modeName,
  );

  Future<List<MatchedRoute>> getRoutesByLineId(
    String lineId,
  );

  Future<List<LineStatus>> getStatusesByLineId(
    String lineId,
  );

  Future<List<LineStatus>> getStatusesByLineIdDate(
    String lineId,
    DateTime fromDate,
    DateTime toDate,
  );

  Future<List<StopPoint>> getStopPointsByLineId(
    String lineId,
  );
}
