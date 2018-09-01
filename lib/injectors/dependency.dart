import 'dart:io';

import 'package:transport_for_london/enums/environment.dart';
import 'package:transport_for_london/factories/platforms/android/platform.dart';
import 'package:transport_for_london/factories/platforms/ios/platform.dart';
import 'package:transport_for_london/factories/platforms/platform.dart';
import 'package:transport_for_london/factories/repos/mocks/repo.dart';
import 'package:transport_for_london/factories/repos/prods/repo.dart';
import 'package:transport_for_london/factories/repos/repo.dart';
import 'package:transport_for_london/factories/services/service.dart';
import 'package:transport_for_london/io/http.dart';
import 'package:transport_for_london/io/platform.dart';
import 'package:transport_for_london/services/bike_point.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/services/platforms/platform.dart';
import 'package:transport_for_london/services/preference.dart';
import 'package:transport_for_london/services/stop_point.dart';

class DependencyInjector implements ServiceFactory {
  // Instances of application's services.
  BikePointService _bikePointService;
  LineService _lineService;
  PlatformService _platformService;
  PreferenceService _preferenceService;
  StopPointService _stopPointService;

  // Instances of application's IO classes.
  final AppHttp _http = new AppHttp();
  final AppPlatform _platform = new AppPlatform();

  // Instances of the factories used by the injector.
  PlatformFactory _platformFactory;
  RepoFactory _repoFactory;

  // Instance of the application's environment.
  static Environment _environment;

  // Set the environment property.
  static set environment(Environment environment) => _environment = environment;

  // Instance of the `DependencyInjector` singleton.
  static final DependencyInjector _singleton = DependencyInjector._internal();

  // Factory constructor which provides the singleton instance.
  factory DependencyInjector() => _singleton;

  // Private constructor called `internal` which creates the injector.
  DependencyInjector._internal();

  // Lazily instantiate and/or get the application's services.
  @override
  BikePointService get bikePointService {
    if (_bikePointService == null) {
      _bikePointService = new BikePointService(repoFactory.bikePointRepo);
    }

    return _bikePointService;
  }

  @override
  LineService get lineService {
    if (_lineService == null) {
      _lineService = new LineService(repoFactory.lineRepo);
    }

    return _lineService;
  }

  @override
  PlatformService get platformService {
    if (_platformService == null) {
      _platformService = platformFactory.platformService;
    }

    return _platformService;
  }

  @override
  PreferenceService get preferenceService {
    if (_preferenceService == null) {
      _preferenceService = new PreferenceService();
    }

    return _preferenceService;
  }

  @override
  StopPointService get stopPointService {
    if (_stopPointService == null) {
      _stopPointService = new StopPointService(repoFactory.stopPointRepo);
    }

    return _stopPointService;
  }

  PlatformFactory get platformFactory {
    if (_platformFactory == null) {
      switch (Platform.operatingSystem) {
        case 'android':
          _platformFactory = new AndroidPlatformFactory(_platform);
          break;
        case 'ios':
          _platformFactory = new IosPlatformFactory(_platform);
          break;
        default:
          throw new Exception(
            'Platform ${Platform.operatingSystem} not supported.',
          );
      }
    }

    return _platformFactory;
  }

  RepoFactory get repoFactory {
    if (_repoFactory == null) {
      switch (_environment) {
        case Environment.MOCK:
          _repoFactory = new MockRepoFactory();
          break;
        case Environment.PROD:
          _repoFactory = new ProdRepoFactory(_http);
          break;
        default:
          throw new Exception(
            'Environment $_environment not supported.',
          );
      }
    }

    return _repoFactory;
  }
}
