import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/locators/service.dart';
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
  State<StatefulWidget> createState() => _ModeStopPointLinesPageState();
}

class _ModeStopPointLinesPageState extends State<ModeStopPointLinesPage> {
  _ModeStopPointLinesPageState() {
    _stopPointService = ServiceLocator().stopPointService;
  }

  List<LineModeGroup> _lineModeGroups;
  StopPointService _stopPointService;

  Widget _buildLines() {
    return DefaultTabController(
      length: _lineModeGroups.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            tabs: _lineModeGroups.map((lineModeGroup) {
              return Tab(text: lineModeGroup.modeName);
            }).toList(),
          ),
          title: Text('Lines'),
        ),
        body: TabBarView(
          children: _lineModeGroups.map(_buildLinesListView).toList(),
        ),
      ),
    );
  }

  Widget _buildLinesListView(LineModeGroup lineModeGroup) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            App.router.navigateTo(
              context,
              '/modes/${lineModeGroup.modeName}/lines/${lineModeGroup.lineIdentifier[index]}',
            );
          },
          title: Text(lineModeGroup.lineIdentifier[index]),
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
      return ScaffoldFutureBuilder<StopPoint>(
        _stopPointService.getStopPointByStopPointId(widget.stopPointId),
        (stopPoint) {
          _lineModeGroups = stopPoint.lineModeGroups;

          return _buildLines();
        },
        LoadingSpinnerScaffold(
          appBar: AppBar(
            title: Text('Lines'),
          ),
        ),
      );
    }
  }
}
