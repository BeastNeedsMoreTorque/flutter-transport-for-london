import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/line_mode_group.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/widgets/loading_spinner_scaffold.dart';
import 'package:transport_for_london/widgets/scaffold_future_builder.dart';

class ModeStopPointLinesPage extends StatefulWidget {
  ModeStopPointLinesPage({
    Key key,
    @required this.modeName,
    @required this.stopPointId,
  }) : super(key: key);

  final String modeName;
  final String stopPointId;

  @override
  State<StatefulWidget> createState() => new _ModeStopPointLinesPageState();
}

class _ModeStopPointLinesPageState extends State<ModeStopPointLinesPage> {
  _ModeStopPointLinesPageState() {
    _stopPointService = new DependencyInjector().stopPointService;
  }

  List<LineModeGroup> _lineModeGroups;
  StopPointService _stopPointService;

  Widget _buildLines() {
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
          children: _lineModeGroups.map(_buildLinesListView).toList(),
        ),
      ),
    );
  }

  Widget _buildLinesListView(LineModeGroup lineModeGroup) {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          onTap: () {
            App.router.navigateTo(
              context,
              '/modes/${lineModeGroup.modeName}/lines/${lineModeGroup.lineIdentifier[index]}',
            );
          },
          title: new Text(lineModeGroup.lineIdentifier[index]),
        );
      },
      itemCount: lineModeGroup.lineIdentifier.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_lineModeGroups != null) {
      return _buildLines();
    } else {
      return new ScaffoldFutureBuilder<StopPoint>(
        _stopPointService.getStopPointByStopPointId(widget.stopPointId),
        (stopPoint) {
          _lineModeGroups = stopPoint.lineModeGroups;

          return _buildLines();
        },
        new LoadingSpinnerScaffold(
          appBar: new AppBar(
            title: new Text('Lines'),
          ),
        ),
      );
    }
  }
}
