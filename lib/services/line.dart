import 'dart:async';

import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/services/http.dart';

class LineService {
  final HttpService _httpService = new HttpService();

  Future<List<Line>> getLinesByMode([String mode = 'tube']) async {
    return await _httpService
        .get<List<Map<String, dynamic>>>('/Line/Mode/$mode')
        .then((lines) {
          return lines.map((line) => new Line.fromJson(line)).toList();
        });
  }
}
