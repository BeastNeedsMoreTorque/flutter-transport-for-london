import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/locators/service.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/widgets/loading_spinner_future_builder.dart';
import 'package:transport_for_london/widgets/modes/lines/stop_points/list_tile.dart';

class ModeLineStopPointsPage extends StatefulWidget {
  const ModeLineStopPointsPage({
    Key key,
    @required this.lineId,
    @required this.modeName,
  }) : super(key: key);

  final String lineId;
  final String modeName;

  @override
  State<StatefulWidget> createState() => _ModeLineStopPointsPageState();
}

class _ModeLineStopPointsPageState extends State<ModeLineStopPointsPage> {
  _ModeLineStopPointsPageState() {
    _lineService = ServiceLocator().lineService;
  }

  LineService _lineService;
  List<StopPoint> _stopPoints;

  Widget _buildStopPoints() {
    if (_stopPoints != null) {
      return _buildStopPointsListView();
    } else {
      return LoadingSpinnerFutureBuilder<List<StopPoint>>(
        _lineService.getStopPointsByLineId(widget.lineId),
        (stopPoints) {
          _stopPoints = stopPoints;

          return _buildStopPointsListView();
        },
      );
    }
  }

  Widget _buildStopPointsListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ModeLineStopPointListTile(
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Stop Points'),
      ),
      body: _buildStopPoints(),
    );
  }
}
