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
  _LineStatusesPageState() {
    _lineStatusItemBuilder = (BuildContext context, int index) {
      return new LineStatusListTileWidget(
        lineStatus: _futureStatuses[index],
      );
    };
  }

  DateTime _fromDate;
  List<LineStatus> _futureStatuses = [];
  bool _isLoading = false;
  LineService _lineService = new LineService();
  IndexedWidgetBuilder _lineStatusItemBuilder;
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

  ListView _buildLineStatusListView() {
    return new ListView.builder(
      itemBuilder: _lineStatusItemBuilder,
      itemCount: _futureStatuses.length,
    );
  }

  Widget _buildLineStatuses() {
    if (_futureStatuses.length > 0) {
      return _buildLineStatusListView();
    } else {
      return new FutureBuilder<List<LineStatus>>(
        builder: (
          BuildContext context,
          AsyncSnapshot<List<LineStatus>> snapshot,
        ) {
          if (snapshot.hasData) {
            _futureStatuses = snapshot.data;
            _lineStatuses = snapshot.data;

            return _buildLineStatusListView();
          } else {
            return new LoadingSpinnerWidget();
          }
        },
        future: _lineService.getLineStatusesByLine(_lineStore.line.id),
      );
    }
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
        setState(() => _isLoading = true);

        return _lineService.getLineStatusesByLineDate(
          _lineStore.line.id,
          fromDate,
          fromDate.add(new Duration(days: 1)),
        );
      }
    }).then((lineStatuses) {
      setState(() {
        _futureStatuses = lineStatuses ?? _lineStatuses;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _isLoading ? new LoadingSpinnerWidget() : _buildLineStatuses(),
    );
  }
}
