import 'package:transport_for_london/factories/repos/repo.dart';
import 'package:transport_for_london/repos/bike_point.dart';
import 'package:transport_for_london/repos/line.dart';
import 'package:transport_for_london/repos/mocks/bike_point.dart';
import 'package:transport_for_london/repos/mocks/line.dart';
import 'package:transport_for_london/repos/mocks/stop_point.dart';
import 'package:transport_for_london/repos/stop_point.dart';

class MockRepoFactory implements RepoFactory {
  BikePointRepo _bikePointRepo;
  LineRepo _lineRepo;
  StopPointRepo _stopPointRepo;

  MockRepoFactory() {
    _bikePointRepo = new MockBikePointRepo();
    _lineRepo = new MockLineRepo();
    _stopPointRepo = new MockStopPointRepo();
  }

  @override
  BikePointRepo get bikePointRepo => _bikePointRepo;

  @override
  LineRepo get lineRepo => _lineRepo;

  @override
  StopPointRepo get stopPointRepo => _stopPointRepo;
}
