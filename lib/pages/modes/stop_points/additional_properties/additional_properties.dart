import 'package:flutter/material.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/additional_property.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/types/predicate.dart';
import 'package:transport_for_london/widgets/additional_properties/list_tile.dart';
import 'package:transport_for_london/widgets/loading_spinner_future_builder.dart';

class ModeStopPointAdditionalPropertiesPage extends StatefulWidget {
  ModeStopPointAdditionalPropertiesPage({
    Key key,
    @required this.modeName,
    @required this.stopPointId,
  }) : super(key: key);

  final String modeName;
  final String stopPointId;

  @override
  State<StatefulWidget> createState() =>
      new _ModeStopPointAdditionalPropertiesPageState();
}

class _ModeStopPointAdditionalPropertiesPageState
    extends State<ModeStopPointAdditionalPropertiesPage> {
  _ModeStopPointAdditionalPropertiesPageState() {
    _additionalPropertyKeyPredicate = (additionalProperty) {
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
    };

    _stopPointService = new DependencyInjector().stopPointService;
  }

  Predicate<AdditionalProperty> _additionalPropertyKeyPredicate;
  bool _isSearching = false;
  StopPoint _stopPoint;
  StopPointService _stopPointService;

  final TextEditingController _searchQuery = new TextEditingController();

  Widget _buildAdditionalProperties() {
    if (_stopPoint != null) {
      return _buildAdditionalPropertiesListView();
    } else {
      return new LoadingSpinnerFutureBuilder<StopPoint>(
        _stopPointService.getStopPointByStopPointId(widget.stopPointId),
        (stopPoint) {
          _stopPoint = stopPoint;

          return _buildAdditionalPropertiesListView();
        },
      );
    }
  }

  Widget _buildAdditionalPropertiesListView() {
    List<AdditionalProperty> additionalProperties = _stopPoint
        .additionalProperties
        .where(_additionalPropertyKeyPredicate)
        .toList();

    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return new AdditionalPropertyListTile(additionalProperties[index]);
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
        _searchQuery.clear();

        setState(() => _isSearching = false);
      },
    ));

    setState(() => _isSearching = true);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _isSearching ? _buildSearchBar() : _buildAppBar(),
      body: _buildAdditionalProperties(),
    );
  }
}
