import 'package:transport_for_london/factories/platforms/platform.dart';
import 'package:transport_for_london/io/platform.dart';
import 'package:transport_for_london/services/platforms/ios/platform.dart';
import 'package:transport_for_london/services/platforms/platform.dart';

class IosPlatformFactory implements PlatformFactory {
  PlatformService _platformService;

  final AppPlatform _platform;

  IosPlatformFactory(this._platform) {
    _platformService = IosPlatformService(_platform);
  }

  @override
  PlatformService get platformService => _platformService;
}
