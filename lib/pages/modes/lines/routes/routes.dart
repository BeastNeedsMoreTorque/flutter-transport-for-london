import 'package:flutter/material.dart';
import 'package:transport_for_london/locators/service.dart';
import 'package:transport_for_london/models/matched_route.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/widgets/loading_spinner_future_builder.dart';
import 'package:transport_for_london/widgets/routes/list_tile.dart';

class ModeLineRoutesPage extends StatefulWidget {
  const ModeLineRoutesPage({
    Key key,
    @required this.lineId,
    @required this.modeName,
  }) : super(key: key);

  final String lineId;
  final String modeName;

  @override
  State<StatefulWidget> createState() => _ModeLineRoutesPageState();
}

class _ModeLineRoutesPageState extends State<ModeLineRoutesPage> {
  _ModeLineRoutesPageState() {
    _lineService = ServiceLocator().lineService;
  }

  LineService _lineService;
  List<MatchedRoute> _routes;

  Widget _buildRoutes() {
    if (_routes != null) {
      return _buildRoutesListView();
    } else {
      return LoadingSpinnerFutureBuilder<List<MatchedRoute>>(
        _lineService.getRoutesByLineId(widget.lineId),
        (routes) {
          _routes = routes;

          return _buildRoutesListView();
        },
      );
    }
  }

  Widget _buildRoutesListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return RouteListTile(_routes[index]);
      },
      itemCount: _routes.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routes'),
      ),
      body: _buildRoutes(),
    );
  }
}
