import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/widgets/loading_spinner_future_builder.dart';
import 'package:transport_for_london/widgets/modes/stop_points/list_tile.dart';

class ModeStopPointsPage extends StatefulWidget {
  const ModeStopPointsPage({
    Key key,
    @required this.modeName,
  }) : super(key: key);

  final String modeName;

  @override
  State<StatefulWidget> createState() => new _ModeStopPointsPageState();
}

class _ModeStopPointsPageState extends State<ModeStopPointsPage> {
  _ModeStopPointsPageState() {
    _stopPointService = new DependencyInjector().stopPointService;
  }

  List<StopPoint> _stopPoints;
  StopPointService _stopPointService;

  Widget _buildStopPoints() {
    if (_stopPoints != null) {
      return _buildStopPointsListView();
    } else {
      return new LoadingSpinnerFutureBuilder<List<StopPoint>>(
        _stopPointService.getStopPointsByModeName(widget.modeName),
        (stopPoints) {
          _stopPoints = stopPoints;

          return _buildStopPointsListView();
        },
      );
    }
  }

  Widget _buildStopPointsListView() {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return new ModeStopPointListTile(
          _stopPoints[index],
          onTap: () {
            App.router.navigateTo(
              context,
              '/modes/${widget.modeName}/stop_points/${_stopPoints[index].id}',
            );
          },
        );
      },
      itemCount: _stopPoints.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Stop Points'),
      ),
      body: _buildStopPoints(),
    );
  }
}
