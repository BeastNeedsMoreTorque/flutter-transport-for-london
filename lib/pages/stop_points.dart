import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/stores/line.dart';
import 'package:transport_for_london/stores/stop_point.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';
import 'package:transport_for_london/widgets/stop_point_list_tile.dart';

class StopPointsPage extends StatefulWidget {
  @override
  _StopPointsPageState createState() => new _StopPointsPageState();
}

class _StopPointsPageState extends State<StopPointsPage>
    with StoreWatcherMixin<StopPointsPage> {
  LineService _lineService = new LineService();
  LineStore _lineStore;
  StopPointStore _stopPointStore;

  @override
  void initState() {
    super.initState();

    _lineStore = listenToStore(lineStoreToken);
    _stopPointStore = listenToStore(stopPointStoreToken);
  }

  AppBar _buildAppBar() {
    return new AppBar(
      actions: _buildAppBarActions(),
      title: new Text(_lineStore.line.name),
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      new IconButton(
        icon: new Icon(Icons.info),
        onPressed: () {
          Navigator.of(context).pushNamed('/line_statuses');
        },
      ),
    ];
  }

  FutureBuilder<List<StopPoint>> _buildStopPoints() {
    return new FutureBuilder<List<StopPoint>>(
      builder: (
        BuildContext context,
        AsyncSnapshot<List<StopPoint>> snapshot,
      ) {
        if (snapshot.hasData) {
          return new ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return new StopPointListTileWidget(
                onTap: () {
                  selectStopPoint(snapshot.data[index]).then((_) {
                    Navigator.of(context).pushNamed('/predictions');
                  });
                },
                stopPoint: snapshot.data[index],
              );
            },
            itemCount: snapshot.data.length,
          );
        } else {
          return new LoadingSpinnerWidget();
        }
      },
      future: _lineService.getStopPointsByLine(_lineStore.line.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildStopPoints(),
    );
  }
}
