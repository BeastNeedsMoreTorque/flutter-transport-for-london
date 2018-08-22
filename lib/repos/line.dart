import 'dart:async';

import 'package:transport_for_london/models/disruption.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/models/stop_point.dart';

abstract class LineRepo {
  Future<List<Disruption>> getDisruptionsByMode(
    String mode,
  );

  Future<Line> getLineByLineId(
    String lineId,
  );

  Future<List<Line>> getLinesByMode(
    String mode,
  );

  Future<List<LineStatus>> getLineStatusesByLineId(
    String lineId,
  );

  Future<List<LineStatus>> getLineStatusesByLineIdDate(
    String lineId,
    DateTime fromDate,
    DateTime toDate,
  );

  Future<List<StopPoint>> getStopPointsByLineId(
    String lineId,
  );
}
