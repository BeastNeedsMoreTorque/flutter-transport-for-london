import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/widgets/drawer.dart';
import 'package:transport_for_london/widgets/line_list_tile.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

class LinesPage extends StatefulWidget {
  @override
  _LinesPageState createState() => new _LinesPageState();
}

class _LinesPageState extends State<LinesPage> {
  _LinesPageState() {
    _lineItemBuilder = (BuildContext context, int index) {
      return new LineListTileWidget(
        line: _lines[index],
        onTap: () => _handleLineListTileTap(_lines[index]),
      );
    };

    _lineService = new DependencyInjector().lineService;
  }

  IndexedWidgetBuilder _lineItemBuilder;
  LineService _lineService;
  List<Line> _lines = [];

  AppBar _buildAppBar() {
    return new AppBar(
      title: new Text('Lines'),
    );
  }

  ListView _buildLineListView() {
    return new ListView.builder(
      itemBuilder: _lineItemBuilder,
      itemCount: _lines.length,
    );
  }

  Widget _buildLines() {
    if (_lines.length > 0) {
      return _buildLineListView();
    } else {
      return new FutureBuilder<List<Line>>(
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Line>> snapshot,
        ) {
          if (snapshot.hasData) {
            _lines = snapshot.data;

            return _buildLineListView();
          } else {
            return new LoadingSpinnerWidget();
          }
        },
        future: _lineService.getLinesByMode(),
      );
    }
  }

  Future<void> _handleLineListTileTap(Line line) async {
    await App.router.navigateTo(context, '/lines/${line.id}');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildLines(),
      drawer: new DrawerWidget(),
    );
  }
}
