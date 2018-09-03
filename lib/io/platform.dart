import 'dart:async';

import 'package:url_launcher/url_launcher.dart' as launcher;

class AppPlatform {
  Future<void> launch(String url) async {
    if (await launcher.canLaunch(url)) {
      await launcher.launch(url);
    } else {
      throw Exception('Could not launch $url.');
    }
  }
}
