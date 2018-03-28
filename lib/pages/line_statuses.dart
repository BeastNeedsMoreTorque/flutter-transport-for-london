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
  DateTime _fromDate;
  LineService _lineService = new LineService();
  List<LineStatus> _lineStatuses = [];
  LineStore _lineStore;

  @override
  void initState() {
    super.initState();

    _lineStore = listenToStore(lineStoreToken);
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
        icon: new Icon(Icons.date_range),
        onPressed: _handleFutureStatusesPressed,
      ),
    ];
  }

  FutureBuilder<List<LineStatus>> _buildLineStatuses() {
    return new FutureBuilder<List<LineStatus>>(
      builder: (
        BuildContext context,
        AsyncSnapshot<List<LineStatus>> snapshot,
      ) {
        if (snapshot.hasData) {
          if (_fromDate == null) _lineStatuses = snapshot.data;

          return new ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return new LineStatusListTileWidget(
                lineStatus: _lineStatuses[index],
              );
            },
            itemCount: _lineStatuses.length,
          );
        } else {
          return new LoadingSpinnerWidget();
        }
      },
      future: _lineService.getLineStatusesByLine(_lineStore.line.id),
    );
  }

  void _handleFutureStatusesPressed() {
    DateTime currentDate = new DateTime.now().subtract(new Duration(days: 1));

    if (_fromDate == null) _fromDate = currentDate.add(new Duration(days: 1));

    showDatePicker(
      context: context,
      initialDate: _fromDate,
      firstDate: currentDate.isAfter(_fromDate) ? _fromDate : currentDate,
      lastDate: currentDate.add(new Duration(days: 61)),
    ).then((fromDate) {
      _fromDate = fromDate;

      if (fromDate != null) {
        return _lineService.getLineStatusesByLineDate(
          _lineStore.line.id,
          fromDate,
          fromDate.add(new Duration(days: 1)),
        );
      }
    }).then((lineStatuses) {
      setState(() => _lineStatuses = lineStatuses ?? []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildLineStatuses(),
    );
  }
}
