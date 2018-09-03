import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/locators/service.dart';
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
  State<StatefulWidget> createState() => _BikePointPageState();
}

class _BikePointPageState extends State<BikePointPage> {
  _BikePointPageState() {
    _bikePointService = ServiceLocator().bikePointService;
    _platformService = ServiceLocator().platformService;
  }

  Place _bikePoint;
  BikePointService _bikePointService;
  PlatformService _platformService;

  Widget _buildBikePoint() {
    return Scaffold(
      appBar: AppBar(
        title: Text(_bikePoint.commonName),
      ),
      body: ListView(
        children: <Widget>[
          _buildBikePointListTile(
            'Information',
            Icon(Icons.info),
            '/bike_points/${widget.bikePointId}/additional_properties',
          ),
          ListTile(
            leading: Icon(Icons.map),
            onTap: () async {
              await _platformService.openMap(
                _bikePoint.lat,
                _bikePoint.lon,
              );
            },
            title: Text('Map'),
          ),
        ],
      ),
    );
  }

  Widget _buildBikePointListTile(String title, Icon icon, String path) {
    return ListTile(
      leading: icon,
      onTap: () => App.router.navigateTo(context, path),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_bikePoint != null) {
      return _buildBikePoint();
    } else {
      return ScaffoldFutureBuilder<Place>(
        _bikePointService.getBikePointByBikePointId(widget.bikePointId),
        (bikePoint) {
          _bikePoint = bikePoint;

          return _buildBikePoint();
        },
        LoadingSpinnerScaffold(
          appBar: AppBar(),
        ),
      );
    }
  }
}
