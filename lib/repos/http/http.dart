import 'dart:async';
import 'dart:convert';
import 'dart:io';

class Http {
  final String _authority = 'api.tfl.gov.uk';
  final HttpClient _httpClient = new HttpClient();
  final Map<String, String> _queryParameters = {
    'app_id': '6b52d4ed',
    'app_key': '1b13d7f40ffa679ad8ff29052ae936a9',
  };

  Future<dynamic> get(String path) async {
    HttpClientRequest request = await _httpClient.getUrl(new Uri.https(
      _authority,
      path,
      _queryParameters,
    ));
    HttpClientResponse response = await request.close();

    if (response.statusCode == HttpStatus.OK) {
      try {
        return json.decode(await response.transform(utf8.decoder).join());
      } catch (_) {
        throw new Exception('000 - Failed to parse response.');
      }
    } else {
      throw new Exception('${response.statusCode} - ${response.reasonPhrase}');
    }
  }
}
