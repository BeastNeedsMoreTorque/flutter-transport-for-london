import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/place.dart';
import 'package:transport_for_london/services/bike_point.dart';
import 'package:transport_for_london/services/platforms/platform.dart';
import 'package:transport_for_london/widgets/loading_spinner_scaffold.dart';
import 'package:transport_for_london/widgets/scaffold_future_builder.dart';

class BikePointPage extends StatefulWidget {
  const BikePointPage({
    Key key,
    @required this.bikePointId,
  }) : super(key: key);

  final String bikePointId;

  @override
  State<StatefulWidget> createState() => new _BikePointPageState();
}

class _BikePointPageState extends State<BikePointPage> {
  _BikePointPageState() {
    _bikePointService = new DependencyInjector().bikePointService;
    _platformService = new DependencyInjector().platformService;
  }

  Place _bikePoint;
  BikePointService _bikePointService;
  PlatformService _platformService;

  Widget _buildBikePoint() {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_bikePoint.commonName),
      ),
      body: new ListView(
        children: <Widget>[
          _buildBikePointListTile(
            'Information',
            new Icon(Icons.info),
            '/bike_points/${widget.bikePointId}/additional_properties',
          ),
          new ListTile(
            leading: new Icon(Icons.map),
            onTap: () async {
              await _platformService.openMap(
                _bikePoint.lat,
                _bikePoint.lon,
              );
            },
            title: new Text('Map'),
          ),
        ],
      ),
    );
  }

  Widget _buildBikePointListTile(String title, Icon icon, String path) {
    return new ListTile(
      leading: icon,
      onTap: () => App.router.navigateTo(context, path),
      title: new Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_bikePoint != null) {
      return _buildBikePoint();
    } else {
      return new ScaffoldFutureBuilder<Place>(
        _bikePointService.getBikePointByBikePointId(widget.bikePointId),
        (bikePoint) {
          _bikePoint = bikePoint;

          return _buildBikePoint();
        },
        new LoadingSpinnerScaffold(
          appBar: new AppBar(),
        ),
      );
    }
  }
}
