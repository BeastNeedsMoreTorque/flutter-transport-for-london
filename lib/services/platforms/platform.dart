import 'dart:async';

abstract class PlatformService {
  Future<void> openMap(
    double lat,
    double lon,
  );
}
