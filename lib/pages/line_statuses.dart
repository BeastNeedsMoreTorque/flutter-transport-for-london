import 'package:flutter/material.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/widgets/line_status_list_tile.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

class LineStatusesPage extends StatefulWidget {
  LineStatusesPage({
    Key key,
    @required this.lineId,
  }) : super(key: key);

  final String lineId;

  @override
  _LineStatusesPageState createState() => new _LineStatusesPageState();
}

class _LineStatusesPageState extends State<LineStatusesPage> {
  _LineStatusesPageState() {
    _lineStatusItemBuilder = (BuildContext context, int index) {
      return new LineStatusListTileWidget(
        lineStatus: _futureStatuses[index],
      );
    };

    _lineService = new DependencyInjector().lineService;
  }

  DateTime _fromDate;
  List<LineStatus> _futureStatuses = [];
  bool _isLoading = false;
  Line _line;
  LineService _lineService;
  IndexedWidgetBuilder _lineStatusItemBuilder;
  List<LineStatus> _lineStatuses = [];

  AppBar _buildAppBar() {
    return new AppBar(
      actions: _buildAppBarActions(),
      title: new Text(_line.name),
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
    if (_isLoading) {
      return new LoadingSpinnerWidget();
    } else if (_futureStatuses.length > 0) {
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
        future: _lineService.getLineStatusesByLineId(_line.id),
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

        return _lineService.getLineStatusesByLineIdDate(
          _line.id,
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
    return new FutureBuilder<Line>(
      builder: (
        BuildContext context,
        AsyncSnapshot<Line> snapshot,
      ) {
        if (snapshot.hasData) {
          _line = snapshot.data;

          return new Scaffold(
            appBar: _buildAppBar(),
            body: _buildLineStatuses(),
          );
        } else {
          return new Scaffold(
            appBar: new AppBar(),
            body: new LoadingSpinnerWidget(),
          );
        }
      },
      future: _lineService.getLineByLineId(widget.lineId),
    );
  }
}
