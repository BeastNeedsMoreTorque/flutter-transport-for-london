import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

class ModeLinePage extends StatefulWidget {
  const ModeLinePage({
    Key key,
    @required this.lineId,
    @required this.modeName,
  }) : super(key: key);

  final String lineId;
  final String modeName;

  @override
  State<StatefulWidget> createState() => new _ModeLinePageState();
}

class _ModeLinePageState extends State<ModeLinePage> {
  _ModeLinePageState() {
    _lineService = new DependencyInjector().lineService;
  }

  Line _line;
  LineService _lineService;

  Widget _buildModeLine() {
    return new ListView(
      children: <Widget>[
        _buildModeLineListTile(
          'Routes',
          new Icon(Icons.directions),
          '/modes/${widget.modeName}/lines/${widget.lineId}/routes',
        ),
        _buildModeLineListTile(
          'Statuses',
          new Icon(Icons.warning),
          '/modes/${widget.modeName}/lines/${widget.lineId}/statuses',
        ),
        _buildModeLineListTile(
          'Stop Points',
          new Icon(Icons.place),
          '/modes/${widget.modeName}/lines/${widget.lineId}/stop_points',
        ),
      ],
    );
  }

  Widget _buildModeLineListTile(String title, Icon icon, String path) {
    return new ListTile(
      leading: icon,
      onTap: () => App.router.navigateTo(context, path),
      title: new Text(title),
    );
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
            appBar: new AppBar(
              title: new Text(_line.name),
            ),
            body: _buildModeLine(),
          );
        } else {
          return new Scaffold(
            appBar: new AppBar(),
            body: new LoadingSpinner(),
          );
        }
      },
      future: _lineService.getLineByLineId(widget.lineId),
    );
  }
}
