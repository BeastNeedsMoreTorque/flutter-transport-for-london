import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/line_mode_group.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

class StopPointLinesPage extends StatefulWidget {
  StopPointLinesPage({
    Key key,
    @required this.stopPointId,
  }) : super(key: key);

  final String stopPointId;

  @override
  State<StatefulWidget> createState() => new _StopPointLinesPageState();
}

class _StopPointLinesPageState extends State<StopPointLinesPage> {
  _StopPointLinesPageState() {
    _stopPointService = new DependencyInjector().stopPointService;
  }

  List<LineModeGroup> _lineModeGroups = [];
  StopPointService _stopPointService;

  Widget _buildStopPointLines() {
    return new DefaultTabController(
      length: _lineModeGroups.length,
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(
            isScrollable: true,
            tabs: _lineModeGroups.map((lineModeGroup) {
              return new Tab(text: lineModeGroup.modeName);
            }).toList(),
          ),
          title: new Text('Lines'),
        ),
        body: new TabBarView(
          children: _lineModeGroups.map((lineModeGroup) {
            return new ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return new ListTile(
                  title: new Text(lineModeGroup.lineIdentifier[index]),
                );
              },
              itemCount: lineModeGroup.lineIdentifier.length,
            );
          }).toList(),
        ),
      ),
    );
  }

  Future<StopPoint> _getStopPoint() {
    return _stopPointService.getStopPointByStopPointId(widget.stopPointId);
  }

  @override
  Widget build(BuildContext context) {
    if (_lineModeGroups.length > 0) {
      return _buildStopPointLines();
    } else {
      return new FutureBuilder<StopPoint>(
        builder: (
          BuildContext context,
          AsyncSnapshot<StopPoint> snapshot,
        ) {
          if (snapshot.hasData) {
            _lineModeGroups = snapshot.data.lineModeGroups;

            return _buildStopPointLines();
          } else {
            return new Scaffold(
              appBar: new AppBar(
                title: new Text('Lines'),
              ),
              body: new LoadingSpinnerWidget(),
            );
          }
        },
        future: _getStopPoint(),
      );
    }
  }
}
