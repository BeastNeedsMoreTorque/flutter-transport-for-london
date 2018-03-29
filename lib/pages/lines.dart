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
  LineService _lineService = new LineService();
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

  FutureBuilder<List<Line>> _buildLines() {
    return new FutureBuilder<List<Line>>(
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Line>> snapshot,
      ) {
        if (snapshot.hasData) {
          return new ListView(
            children: snapshot.data.map((Line line) {
              return new LineListTileWidget(
                line: line,
                onTap: () {
                  selectLine(line).then((_) {
                    return Navigator.of(context).pushNamed('/stop_points');
                  }).then((_) => resetLine());
                },
              );
            }).toList(),
          );
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
