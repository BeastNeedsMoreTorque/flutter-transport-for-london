import 'package:flutter/material.dart';
import 'package:transport_for_london/locators/service.dart';
import 'package:transport_for_london/models/additional_property.dart';
import 'package:transport_for_london/models/place.dart';
import 'package:transport_for_london/services/bike_point.dart';
import 'package:transport_for_london/types/predicate.dart';
import 'package:transport_for_london/widgets/additional_properties/list_tile.dart';
import 'package:transport_for_london/widgets/loading_spinner_future_builder.dart';

class BikePointAdditionalPropertiesPage extends StatefulWidget {
  BikePointAdditionalPropertiesPage({
    Key key,
    @required this.bikePointId,
  }) : super(key: key);

  final String bikePointId;

  @override
  State<StatefulWidget> createState() =>
      _BikePointAdditionalPropertiesPageState();
}

class _BikePointAdditionalPropertiesPageState
    extends State<BikePointAdditionalPropertiesPage> {
  _BikePointAdditionalPropertiesPageState() {
    _additionalPropertyKeyPredicate = (additionalProperty) {
      if (_searchQuery.text.isEmpty) {
        return true;
      } else {
        return additionalProperty.key.contains(
          RegExp(
            _searchQuery.text,
            caseSensitive: false,
          ),
        );
      }
    };

    _bikePointService = ServiceLocator().bikePointService;
  }

  Predicate<AdditionalProperty> _additionalPropertyKeyPredicate;
  Place _bikePoint;
  BikePointService _bikePointService;
  bool _isSearching = false;

  final TextEditingController _searchQuery = TextEditingController();

  Widget _buildAdditionalProperties() {
    if (_bikePoint != null) {
      return _buildAdditionalPropertiesListView();
    } else {
      return LoadingSpinnerFutureBuilder<Place>(
        _bikePointService.getBikePointByBikePointId(widget.bikePointId),
        (bikePoint) {
          _bikePoint = bikePoint;

          return _buildAdditionalPropertiesListView();
        },
      );
    }
  }

  Widget _buildAdditionalPropertiesListView() {
    List<AdditionalProperty> additionalProperties = _bikePoint
        .additionalProperties
        .where(_additionalPropertyKeyPredicate)
        .toList();

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return AdditionalPropertyListTile(additionalProperties[index]);
      },
      itemCount: additionalProperties.length,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: _handleSearchBegin,
          tooltip: 'Search',
        ),
      ],
      title: Text('Information'),
    );
  }

  AppBar _buildSearchBar() {
    return AppBar(
      title: TextField(
        autofocus: true,
        controller: _searchQuery,
        decoration: InputDecoration(
          hintText: 'Search by additional property key',
        ),
      ),
    );
  }

  void _handleSearchBegin() {
    ModalRoute.of(context).addLocalHistoryEntry(LocalHistoryEntry(
      onRemove: () {
        _searchQuery.clear();

        setState(() => _isSearching = false);
      },
    ));

    setState(() => _isSearching = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isSearching ? _buildSearchBar() : _buildAppBar(),
      body: _buildAdditionalProperties(),
    );
  }
}
