import 'package:flutter/material.dart';
import 'package:transport_for_london/injectors/dependency.dart';
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
  State<StatefulWidget> createState() => new _ModeLineRoutesPageState();
}

class _ModeLineRoutesPageState extends State<ModeLineRoutesPage> {
  _ModeLineRoutesPageState() {
    _lineService = new DependencyInjector().lineService;
  }

  LineService _lineService;
  List<MatchedRoute> _routes;

  Widget _buildRoutes() {
    if (_routes != null) {
      return _buildRoutesListView();
    } else {
      return new LoadingSpinnerFutureBuilder<List<MatchedRoute>>(
        _lineService.getRoutesByLineId(widget.lineId),
        (routes) {
          _routes = routes;

          return _buildRoutesListView();
        },
      );
    }
  }

  Widget _buildRoutesListView() {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return new RouteListTile(_routes[index]);
      },
      itemCount: _routes.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Routes'),
      ),
      body: _buildRoutes(),
    );
  }
}
