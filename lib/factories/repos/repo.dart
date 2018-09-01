import 'package:transport_for_london/repos/bike_point.dart';
import 'package:transport_for_london/repos/line.dart';
import 'package:transport_for_london/repos/stop_point.dart';

abstract class RepoFactory {
  BikePointRepo get bikePointRepo;
  LineRepo get lineRepo;
  StopPointRepo get stopPointRepo;
}
