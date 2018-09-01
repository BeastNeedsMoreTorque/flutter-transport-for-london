import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class AppHttp {
  final String _authority = 'api.tfl.gov.uk';
  final Map<String, String> _queryParameters = {
    'app_id': '6b52d4ed',
    'app_key': '1b13d7f40ffa679ad8ff29052ae936a9',
  };

  Future<dynamic> get(String path) async {
    http.Response response = await http.get(
      new Uri.https(
        _authority,
        path,
        _queryParameters,
      ),
    );

    if (response.statusCode == HttpStatus.OK) {
      try {
        return json.decode(response.body);
      } catch (exception) {
        throw new Exception('000 - ${exception}');
      }
    } else {
      throw new Exception('${response.statusCode} - ${response.reasonPhrase}');
    }
  }
}
