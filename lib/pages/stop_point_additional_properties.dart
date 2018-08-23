import 'package:flutter/material.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/additional_property.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/widgets/additional_property_list_tile.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

class StopPointAdditionalPropertiesPage extends StatefulWidget {
  StopPointAdditionalPropertiesPage({
    Key key,
    @required this.stopPointId,
  }) : super(key: key);

  final String stopPointId;

  @override
  _StopPointAdditionalPropertiesPageState createState() =>
      new _StopPointAdditionalPropertiesPageState();
}

class _StopPointAdditionalPropertiesPageState
    extends State<StopPointAdditionalPropertiesPage> {
  _StopPointAdditionalPropertiesPageState() {
    _stopPointService = new DependencyInjector().stopPointService;
  }

  bool _isSearching = false;
  StopPoint _stopPoint;
  StopPointService _stopPointService;

  final TextEditingController _searchQuery = new TextEditingController();

  Widget _buildAdditionalProperties() {
    if (_stopPoint != null) {
      return _buildAdditionalPropertiesListView();
    } else {
      return new FutureBuilder<StopPoint>(
        builder: (
          BuildContext context,
          AsyncSnapshot<StopPoint> snapshot,
        ) {
          if (snapshot.hasData) {
            _stopPoint = snapshot.data;

            return _buildAdditionalPropertiesListView();
          } else {
            return new LoadingSpinnerWidget();
          }
        },
        future: _stopPointService.getStopPointByStopPointId(widget.stopPointId),
      );
    }
  }

  Widget _buildAdditionalPropertiesListView() {
    List<AdditionalProperty> additionalProperties =
        _stopPoint.additionalProperties.where((additionalProperty) {
      if (_searchQuery.text.isEmpty) {
        return true;
      } else {
        return additionalProperty.key.contains(
          new RegExp(
            _searchQuery.text,
            caseSensitive: false,
          ),
        );
      }
    }).toList();

    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return new AdditionalPropertyListTileWidget(
          additionalProperty: additionalProperties[index],
        );
      },
      itemCount: additionalProperties.length,
    );
  }

  AppBar _buildAppBar() {
    return new AppBar(
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.search),
          onPressed: _handleSearchBegin,
          tooltip: 'Search',
        ),
      ],
      title: new Text('Information'),
    );
  }

  AppBar _buildSearchBar() {
    return new AppBar(
      title: new TextField(
        autofocus: true,
        controller: _searchQuery,
        decoration: new InputDecoration(
          hintText: 'Search by additional property key',
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
      body: _buildAdditionalProperties(),
    );
  }
}
