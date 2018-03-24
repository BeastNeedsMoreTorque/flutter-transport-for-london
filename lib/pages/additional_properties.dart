import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:transport_for_london/models/additional_property.dart';
import 'package:transport_for_london/stores/stop_point.dart';
import 'package:transport_for_london/widgets/additional_property_list_tile.dart';

class AdditionalPropertiesPage extends StatefulWidget {
  @override
  _AdditionalPropertiesPageState createState() =>
      new _AdditionalPropertiesPageState();
}

class _AdditionalPropertiesPageState extends State<AdditionalPropertiesPage>
    with StoreWatcherMixin<AdditionalPropertiesPage> {
  bool _isSearching = false;
  StopPointStore _stopPointStore;

  final TextEditingController _searchQuery = new TextEditingController();

  @override
  void initState() {
    super.initState();

    _stopPointStore = listenToStore(stopPointStoreToken);
  }

  ListView _buildAdditionalProperties() {
    List<AdditionalProperty> additionalProperties = _stopPointStore
        .stopPoint.additionalProperties
        .where((additionalProperty) {
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
      title: new Text(_stopPointStore.stopPoint.commonName),
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
