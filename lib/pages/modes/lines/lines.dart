import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/widgets/lines/list_tile.dart';
import 'package:transport_for_london/widgets/loading_spinner_future_builder.dart';

class ModeLinesPage extends StatefulWidget {
  const ModeLinesPage({
    Key key,
    @required this.modeName,
  }) : super(key: key);

  final String modeName;

  @override
  State<StatefulWidget> createState() => new _ModeLinesPageState();
}

class _ModeLinesPageState extends State<ModeLinesPage> {
  _ModeLinesPageState() {
    _lineService = new DependencyInjector().lineService;
  }

  LineService _lineService;
  List<Line> _lines;

  Widget _buildLines() {
    if (_lines != null) {
      return _buildLinesListView();
    } else {
      return new LoadingSpinnerFutureBuilder<List<Line>>(
        _lineService.getLinesByModeName(widget.modeName),
        (lines) {
          _lines = lines;

          return _buildLinesListView();
        },
      );
    }
  }

  Widget _buildLinesListView() {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return new LineListTile(
          _lines[index],
          onTap: () {
            App.router.navigateTo(
              context,
              '/modes/${widget.modeName}/lines/${_lines[index].id}',
            );
          },
        );
      },
      itemCount: _lines.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Lines'),
      ),
      body: _buildLines(),
    );
  }
}
