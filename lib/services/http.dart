import 'dart:async';
import 'dart:convert';
import 'dart:io';

class HttpService {
  final String _authority = 'api.tfl.gov.uk';
  final HttpClient _httpClient = new HttpClient();
  final Map<String, String> _queryParameters = {
    'app_id': '6b52d4ed',
    'app_key': '1b13d7f40ffa679ad8ff29052ae936a9',
  };

  Future<T> get<T>(String path) async {
    HttpClientRequest request = await _httpClient.getUrl(new Uri.https(
      _authority,
      path,
      _queryParameters,
    ));
    HttpClientResponse response = await request.close();

    if (response.statusCode == HttpStatus.OK) {
      String json = await response.transform(UTF8.decoder).join();
      return JSON.decode(json);
    } else {
      throw new Exception('${response.statusCode} - ${response.reasonPhrase}');
    }
  }
}
