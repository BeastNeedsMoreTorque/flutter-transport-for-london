import 'package:transport_for_london/enums/environment.dart';
import 'package:transport_for_london/repos/http/line.dart';
import 'package:transport_for_london/repos/http/stop_point.dart';
import 'package:transport_for_london/repos/line.dart';
import 'package:transport_for_london/repos/mock/line.dart';
import 'package:transport_for_london/repos/mock/stop_point.dart';
import 'package:transport_for_london/repos/stop_point.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/services/preferences.dart';
import 'package:transport_for_london/services/stop_point.dart';

class DependencyInjector {
  // Instance of the `DependencyInjector` singleton.
  static final DependencyInjector _singleton = DependencyInjector._internal();

  // Represents the application's environment.
  static Environment _environment;

  // Configure the environment property.
  static void configure(Environment environment) => _environment = environment;

  // Factory constructor which provides the singleton instance.
  factory DependencyInjector() => _singleton;

  // Private constructor called `internal` which creates the injector.
  DependencyInjector._internal();

  // Get the application's repositories based on the environment.
  LineRepo get _lineRepo {
    switch (_environment) {
      case Environment.MOCK: return new MockLineRepo();
      default: return new HttpLineRepo();
    }
  }
  StopPointRepo get _stopPointRepo {
    switch (_environment) {
      case Environment.MOCK: return new MockStopPointRepo();
      default: return new HttpStopPointRepo();
    }
  }

  // Get the application's services using appropriate repositories.
  LineService get lineService {
    return new LineService(_lineRepo);
  }
  PreferencesService get preferencesService {
    return new PreferencesService();
  }
  StopPointService get stopPointService {
    return new StopPointService(_stopPointRepo);
  }
}
