import 'package:transport_for_london/factories/repos/repo.dart';
import 'package:transport_for_london/io/http.dart';
import 'package:transport_for_london/repos/bike_point.dart';
import 'package:transport_for_london/repos/line.dart';
import 'package:transport_for_london/repos/prods/bike_point.dart';
import 'package:transport_for_london/repos/prods/line.dart';
import 'package:transport_for_london/repos/prods/stop_point.dart';
import 'package:transport_for_london/repos/stop_point.dart';

class ProdRepoFactory implements RepoFactory {
  BikePointRepo _bikePointRepo;
  LineRepo _lineRepo;
  StopPointRepo _stopPointRepo;

  final AppHttp _http;

  ProdRepoFactory(this._http) {
    _bikePointRepo = ProdBikePointRepo(_http);
    _lineRepo = ProdLineRepo(_http);
    _stopPointRepo = ProdStopPointRepo(_http);
  }

  @override
  BikePointRepo get bikePointRepo => _bikePointRepo;

  @override
  LineRepo get lineRepo => _lineRepo;

  @override
  StopPointRepo get stopPointRepo => _stopPointRepo;
}
