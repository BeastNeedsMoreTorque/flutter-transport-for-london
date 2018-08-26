import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/widgets/loading_spinner_scaffold.dart';
import 'package:transport_for_london/widgets/scaffold_future_builder.dart';

class ModeStopPointPage extends StatefulWidget {
  const ModeStopPointPage({
    Key key,
    @required this.modeName,
    @required this.stopPointId,
  }) : super(key: key);

  final String modeName;
  final String stopPointId;

  @override
  State<StatefulWidget> createState() => new _ModeStopPointPageState();
}

class _ModeStopPointPageState extends State<ModeStopPointPage> {
  _ModeStopPointPageState() {
    _stopPointService = new DependencyInjector().stopPointService;
  }

  StopPoint _stopPoint;
  StopPointService _stopPointService;

  Widget _buildModeLineStopPoint() {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_stopPoint.commonName),
      ),
      body: new ListView(
        children: <Widget>[
          _buildModeLineStopPointListTile(
            'Arrivals',
            new Icon(Icons.rss_feed),
            '/modes/${widget.modeName}/stop_points/${widget.stopPointId}/arrivals',
          ),
          _buildModeLineStopPointListTile(
            'Children',
            new Icon(Icons.supervisor_account),
            '/modes/${widget.modeName}/stop_points/${widget.stopPointId}/children',
          ),
          _buildModeLineStopPointListTile(
            'Information',
            new Icon(Icons.info),
            '/modes/${widget.modeName}/stop_points/${widget.stopPointId}/additional_properties',
          ),
          _buildModeLineStopPointListTile(
            'Lines',
            new Icon(Icons.reorder),
            '/modes/${widget.modeName}/stop_points/${widget.stopPointId}/lines',
          ),
        ],
      ),
    );
  }

  Widget _buildModeLineStopPointListTile(String title, Icon icon, String path) {
    return new ListTile(
      leading: icon,
      onTap: () => App.router.navigateTo(context, path),
      title: new Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_stopPoint != null) {
      return _buildModeLineStopPoint();
    } else {
      return new ScaffoldFutureBuilder<StopPoint>(
        _stopPointService.getStopPointByStopPointId(widget.stopPointId),
        (stopPoint) {
          _stopPoint = stopPoint;

          return _buildModeLineStopPoint();
        },
        new LoadingSpinnerScaffold(
          appBar: new AppBar(),
        ),
      );
    }
  }
}
