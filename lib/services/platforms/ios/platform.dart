import 'dart:async';

import 'package:transport_for_london/io/platform.dart';
import 'package:transport_for_london/services/platforms/platform.dart';

class IosPlatformService implements PlatformService {
  IosPlatformService(this._platform);

  final AppPlatform _platform;

  @override
  Future<void> openMap(
    double lat,
    double lon,
  ) async {
    await _platform.launch('http://maps.apple.com/?ll=$lat,$lon&z=20');
  }
}
