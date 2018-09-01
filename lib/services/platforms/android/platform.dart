import 'dart:async';

import 'package:transport_for_london/io/platform.dart';
import 'package:transport_for_london/services/platforms/platform.dart';

class AndroidPlatformService implements PlatformService {
  AndroidPlatformService(this._platform);

  final AppPlatform _platform;

  @override
  Future<void> openMap(
    double lat,
    double lon,
  ) async {
    await _platform.launch('geo:$lat,$lon?z=20');
  }
}
