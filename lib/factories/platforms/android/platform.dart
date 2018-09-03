import 'package:transport_for_london/factories/platforms/platform.dart';
import 'package:transport_for_london/io/platform.dart';
import 'package:transport_for_london/services/platforms/android/platform.dart';
import 'package:transport_for_london/services/platforms/platform.dart';

class AndroidPlatformFactory implements PlatformFactory {
  PlatformService _platformService;

  final AppPlatform _platform;

  AndroidPlatformFactory(this._platform) {
    _platformService = AndroidPlatformService(_platform);
  }

  @override
  PlatformService get platformService => _platformService;
}
