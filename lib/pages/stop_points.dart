import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/stores/line.dart';
import 'package:transport_for_london/stores/stop_point.dart';
import 'package:transport_for_london/types/predicate.dart';
import 'package:transport_for_london/widgets/drawer.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';
import 'package:transport_for_london/widgets/search_icon_button.dart';
import 'package:transport_for_london/widgets/stop_point_list_tile.dart';

class StopPointsPage extends StatefulWidget {
  @override
  _StopPointsPageState createState() => new _StopPointsPageState();
}

class _StopPointsPageState extends State<StopPointsPage>
    with StoreWatcherMixin<StopPointsPage> {
  _StopPointsPageState() {
    _stopPointItemBuilder = (
      BuildContext context,
      int index,
    ) {
      return new StopPointListTileWidget(
        onTap: () {
          selectStopPoint(_filteredStopPoints[index]).then((_) {
            Navigator.of(context).pushNamed('/predictions');
          });
        },
        stopPoint: _filteredStopPoints[index],
      );
    };

    _stopPointNamePredicate = (stopPoint) {
      return stopPoint.commonName.contains(
        new RegExp(
          _searchQuery.text,
          caseSensitive: false,
        ),
      );
    };
  }

  List<StopPoint> _filteredStopPoints = [];
  bool _isSearching = false;
  LineService _lineService = new LineService();
  LineStore _lineStore;
  IndexedWidgetBuilder _stopPointItemBuilder;
  Predicate<StopPoint> _stopPointNamePredicate;
  StopPointService _stopPointService = new StopPointService();
  StopPointStore _stopPointStore;
  List<StopPoint> _stopPoints = [];

  final TextEditingController _searchQuery = new TextEditingController();

  @override
  void initState() {
    super.initState();

    _lineStore = listenToStore(lineStoreToken);
    _stopPointStore = listenToStore(stopPointStoreToken);
  }

  AppBar _buildAppBar() {
    return new AppBar(
      actions: _buildAppBarActions(),
      title: new Text(
        _lineStore.line != null ? _lineStore.line.name : 'Stop Points',
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    if (_lineStore.line != null) {
      return [
        new IconButton(
          icon: new Icon(Icons.info),
          onPressed: () {
            Navigator.of(context).pushNamed('/line_statuses');
          },
        ),
        new SearchIconButtonWidget(onPressed: _handleSearchBegin),
      ];
    } else {
      return [
        new SearchIconButtonWidget(onPressed: _handleSearchBegin),
      ];
    }
  }

  ListView _buildStopPointListView() {
    return new ListView.builder(
      itemBuilder: _stopPointItemBuilder,
      itemCount: _filteredStopPoints.length,
    );
  }

  Widget _buildStopPoints() {
    if (_stopPoints.length > 0) {
      _filteredStopPoints = _stopPoints;

      if (_isSearching && _searchQuery.text.isNotEmpty) {
        _filteredStopPoints =
            _stopPoints.where(_stopPointNamePredicate).toList();
      }

      return _buildStopPointListView();
    } else {
      return new FutureBuilder<List<StopPoint>>(
        builder: (
          BuildContext context,
          AsyncSnapshot<List<StopPoint>> snapshot,
        ) {
          if (snapshot.hasData) {
            _filteredStopPoints = snapshot.data;
            _stopPoints = snapshot.data;

            return _buildStopPointListView();
          } else {
            return new LoadingSpinnerWidget();
          }
        },
        future: _lineStore.line != null
            ? _lineService.getStopPointsByLine(_lineStore.line.id)
            : _stopPointService.getStopPointsByTypeMode(),
      );
    }
  }

  AppBar _buildSearchBar() {
    return new AppBar(
      title: new TextField(
        autofocus: true,
        controller: _searchQuery,
        decoration: new InputDecoration(
          hintText: 'Search by stop point name',
        ),
      ),
    );
  }

  void _handleSearchBegin() {
    ModalRoute.of(context).addLocalHistoryEntry(new LocalHistoryEntry(
      onRemove: () {
        setState(() {
          _isSearching = false;
          _searchQuery.clear();
        });
      },
    ));

    setState(() {
      _isSearching = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _isSearching ? _buildSearchBar() : _buildAppBar(),
      body: _buildStopPoints(),
      drawer:
          _lineStore.line == null && !_isSearching ? new DrawerWidget() : null,
    );
  }
}
