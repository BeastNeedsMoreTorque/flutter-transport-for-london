import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/widgets/line_status_list_tile.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';
import 'package:transport_for_london/widgets/sliver_text_divider.dart';
import 'package:transport_for_london/widgets/stop_point_list_tile.dart';

class LinePage extends StatefulWidget {
  const LinePage({
    Key key,
    @required this.lineId,
  }) : super(key: key);

  final String lineId;

  @override
  _LinePageState createState() => new _LinePageState();
}

class _LinePageState extends State<LinePage> {
  _LinePageState() {
    _lineStatusItemBuilder = (BuildContext context, int index) {
      return new LineStatusListTileWidget(
        lineStatus: _lineStatuses[index],
      );
    };

    _stopPointItemBuilder = (BuildContext context, int index) {
      return new StopPointListTileWidget(
        onTap: () => _handleStopPointListTileTap(_stopPoints[index]),
        stopPoint: _stopPoints[index],
      );
    };

    _lineService = new DependencyInjector().lineService;
  }

  Line _line;
  LineService _lineService;
  IndexedWidgetBuilder _lineStatusItemBuilder;
  List<LineStatus> _lineStatuses = [];
  IndexedWidgetBuilder _stopPointItemBuilder;
  List<StopPoint> _stopPoints = [];

  AppBar _buildAppBar() {
    return new AppBar(
      title: new Text(_line.name),
    );
  }

  Widget _buildLine() {
    if (_lineStatuses.length > 0 && _stopPoints.length > 0) {
      return _buildLineScrollView();
    } else {
      return new FutureBuilder<List<dynamic>>(
        builder: (
          BuildContext context,
          AsyncSnapshot<List<dynamic>> snapshot,
        ) {
          if (snapshot.hasData) {
            _lineStatuses = snapshot.data[0];
            _stopPoints = snapshot.data[1];

            return _buildLineScrollView();
          } else {
            return new LoadingSpinnerWidget();
          }
        },
        future: Future.wait([
          _lineService.getLineStatusesByLineId(widget.lineId),
          _lineService.getStopPointsByLineId(widget.lineId),
        ]),
      );
    }
  }

  Widget _buildLineScrollView() {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverTextDividerWidget(text: 'Line Status'),
        new SliverList(
          delegate: new SliverChildBuilderDelegate(
            _lineStatusItemBuilder,
            childCount: _lineStatuses.length,
          ),
        ),
        new SliverTextDividerWidget(text: 'Stop Points'),
        new SliverFixedExtentList(
          delegate: new SliverChildBuilderDelegate(
            _stopPointItemBuilder,
            childCount: _stopPoints.length,
          ),
          itemExtent: 72.0,
        ),
      ],
    );
  }

  Future<void> _handleStopPointListTileTap(StopPoint stopPoint) async {
    await App.router.navigateTo(context, '/stop_points/${stopPoint.id}');
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<Line>(
      builder: (
        BuildContext context,
        AsyncSnapshot<Line> snapshot,
      ) {
        if (snapshot.hasData) {
          _line = snapshot.data;

          return new Scaffold(
            appBar: _buildAppBar(),
            body: _buildLine(),
          );
        } else {
          return new Scaffold(
            appBar: new AppBar(),
            body: new LoadingSpinnerWidget(),
          );
        }
      },
      future: _lineService.getLineByLineId(widget.lineId),
    );
  }
}
