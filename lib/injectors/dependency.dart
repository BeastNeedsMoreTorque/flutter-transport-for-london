import 'package:transport_for_london/enums/environment.dart';
import 'package:transport_for_london/io/http.dart';
import 'package:transport_for_london/repos/prods/line.dart';
import 'package:transport_for_london/repos/prods/stop_point.dart';
import 'package:transport_for_london/repos/line.dart';
import 'package:transport_for_london/repos/mocks/line.dart';
import 'package:transport_for_london/repos/mocks/stop_point.dart';
import 'package:transport_for_london/repos/stop_point.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/services/preference.dart';
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
      default: return new ProdLineRepo(_http);
    }
  }
  StopPointRepo get _stopPointRepo {
    switch (_environment) {
      case Environment.MOCK: return new MockStopPointRepo();
      default: return new ProdStopPointRepo(_http);
    }
  }

  // Get the application's services using appropriate repositories.
  LineService get lineService {
    return new LineService(_lineRepo);
  }
  PreferenceService get preferenceService {
    return new PreferenceService();
  }
  StopPointService get stopPointService {
    return new StopPointService(_stopPointRepo);
  }

  // Get the application's IO classes.
  Http get _http {
    return new Http();
  }
}
