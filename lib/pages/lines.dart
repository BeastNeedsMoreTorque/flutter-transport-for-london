import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/stores/line.dart';
import 'package:transport_for_london/widgets/drawer.dart';
import 'package:transport_for_london/widgets/line_list_tile.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

class LinesPage extends StatefulWidget {
  @override
  _LinesPageState createState() => new _LinesPageState();
}

class _LinesPageState extends State<LinesPage>
    with StoreWatcherMixin<LinesPage> {
  _LinesPageState() {
    _lineItemBuilder = (BuildContext context, int index) {
      return new LineListTileWidget(
        line: _lines[index],
        onTap: () {
          selectLine(_lines[index]).then((_) {
            return Navigator.of(context).pushNamed('/stop_points');
          }).then((_) => resetLine());
        },
      );
    };
  }

  IndexedWidgetBuilder _lineItemBuilder;
  LineService _lineService = new LineService();
  List<Line> _lines = [];
  LineStore _lineStore;

  @override
  void initState() {
    super.initState();

    _lineStore = listenToStore(lineStoreToken);
  }

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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildLines(),
      drawer: new DrawerWidget(),
    );
  }
}
