import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/stores/line.dart';
import 'package:transport_for_london/widgets/line_status_list_tile.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

class LineStatusesPage extends StatefulWidget {
  @override
  _LineStatusesPageState createState() => new _LineStatusesPageState();
}

class _LineStatusesPageState extends State<LineStatusesPage>
    with StoreWatcherMixin<LineStatusesPage> {
  LineService _lineService = new LineService();
  LineStore _lineStore;

  @override
  void initState() {
    super.initState();

    _lineStore = listenToStore(lineStoreToken);
  }

  AppBar _buildAppBar() {
    return new AppBar(
      title: new Text(_lineStore.line.name),
    );
  }

  FutureBuilder<List<LineStatus>> _buildLineStatuses() {
    return new FutureBuilder<List<LineStatus>>(
      builder: (
        BuildContext context,
        AsyncSnapshot<List<LineStatus>> snapshot,
      ) {
        if (snapshot.hasData) {
          return new ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return new LineStatusListTileWidget(
                lineStatus: snapshot.data[index],
              );
            },
            itemCount: snapshot.data.length,
          );
        } else {
          return new LoadingSpinnerWidget();
        }
      },
      future: _lineService.getLineStatusesByLine(_lineStore.line.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildLineStatuses(),
    );
  }
}
