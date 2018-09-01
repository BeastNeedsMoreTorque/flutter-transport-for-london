import 'package:transport_for_london/services/bike_point.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/services/platforms/platform.dart';
import 'package:transport_for_london/services/preference.dart';
import 'package:transport_for_london/services/stop_point.dart';

abstract class ServiceFactory {
  BikePointService get bikePointService;
  LineService get lineService;
  PlatformService get platformService;
  PreferenceService get preferenceService;
  StopPointService get stopPointService;
}
