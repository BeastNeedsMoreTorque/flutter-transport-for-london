import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/types/predicate.dart';
import 'package:transport_for_london/utils/stop_point.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';
import 'package:transport_for_london/widgets/search_icon_button.dart';
import 'package:transport_for_london/widgets/stop_point_list_tile.dart';

class EditFavouriteStopPointPage extends StatefulWidget {
  EditFavouriteStopPointPage({
    Key key,
    @required this.stopPointLabel,
  }) : super(key: key);

  final String stopPointLabel;

  @override
  _EditFavouriteStopPointPageState createState() =>
      new _EditFavouriteStopPointPageState();
}

class _EditFavouriteStopPointPageState
    extends State<EditFavouriteStopPointPage> {
  _EditFavouriteStopPointPageState() {
    _stopPointItemBuilder = (
      BuildContext context,
      int index,
    ) {
      return new StopPointListTileWidget(
        onTap: () => _handleStopPointListTileTap(_filteredStopPoints[index]),
        stopPoint: _filteredStopPoints[index],
      );
    };

    _stopPointNamePredicate = (stopPoint) {
      return doesStopPointCommonNameContainQuery(stopPoint, _searchQuery.text);
    };

    _stopPointService = new DependencyInjector().stopPointService;
  }

  List<StopPoint> _filteredStopPoints = [];
  bool _isSearching = false;
  IndexedWidgetBuilder _stopPointItemBuilder;
  Predicate<StopPoint> _stopPointNamePredicate;
  StopPointService _stopPointService;
  List<StopPoint> _stopPoints = [];

  final TextEditingController _searchQuery = new TextEditingController();

  AppBar _buildAppBar() {
    return new AppBar(
      actions: [
        new SearchIconButtonWidget(onPressed: _handleSearchBegin),
      ],
      title: new Text(widget.stopPointLabel),
    );
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
        future: _stopPointService.getStopPointsByTypeMode(),
      );
    }
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

  Future<void> _handleStopPointListTileTap(StopPoint stopPoint) async {
    if (_isSearching) await Navigator.pop(context);
    await Navigator.pop(context, stopPoint);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _isSearching ? _buildSearchBar() : _buildAppBar(),
      body: _buildStopPoints(),
    );
  }
}
