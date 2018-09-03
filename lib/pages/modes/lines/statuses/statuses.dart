import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transport_for_london/locators/service.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';
import 'package:transport_for_london/widgets/loading_spinner_future_builder.dart';
import 'package:transport_for_london/widgets/statuses/list_tile.dart';

class ModeLineStatusesPage extends StatefulWidget {
  ModeLineStatusesPage({
    Key key,
    @required this.lineId,
    @required this.modeName,
  }) : super(key: key);

  final String lineId;
  final String modeName;

  @override
  State<StatefulWidget> createState() => _ModeLineStatusesPageState();
}

class _ModeLineStatusesPageState extends State<ModeLineStatusesPage> {
  _ModeLineStatusesPageState() {
    _lineService = ServiceLocator().lineService;
  }

  DateTime _fromDate;
  List<LineStatus> _futureStatuses;
  bool _isLoading = false;
  LineService _lineService;
  List<LineStatus> _statuses;

  List<Widget> _buildAppBarActions() {
    return [
      IconButton(
        icon: Icon(Icons.date_range),
        onPressed: _handleFutureStatusesPressed,
      ),
    ];
  }

  ListView _buildStatusListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return StatusListTile(_futureStatuses[index]);
      },
      itemCount: _futureStatuses.length,
    );
  }

  Widget _buildStatuses() {
    if (_isLoading) {
      return LoadingSpinner();
    } else if (_futureStatuses != null) {
      return _buildStatusListView();
    } else {
      return LoadingSpinnerFutureBuilder<List<LineStatus>>(
        _lineService.getStatusesByLineId(widget.lineId),
        (statuses) {
          _futureStatuses = statuses;
          _statuses = statuses;

          return _buildStatusListView();
        },
      );
    }
  }

  Future<void> _handleFutureStatusesPressed() async {
    DateTime currentDate = DateTime.now();

    _fromDate = await showDatePicker(
      context: context,
      initialDate: _fromDate ?? currentDate,
      firstDate: currentDate.subtract(Duration(days: 1)),
      lastDate: currentDate.add(Duration(days: 61)),
    );

    if (_fromDate != null) {
      setState(() => _isLoading = true);

      _futureStatuses = await _lineService.getStatusesByLineIdDate(
        widget.lineId,
        _fromDate,
        _fromDate.add(Duration(days: 1)),
      );

      setState(() => _isLoading = false);
    } else {
      setState(() => _futureStatuses = _statuses);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: _buildAppBarActions(),
        title: Text('Statuses'),
      ),
      body: _buildStatuses(),
    );
  }
}
