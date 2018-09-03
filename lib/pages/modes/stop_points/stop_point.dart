import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/locators/service.dart';
import 'package:transport_for_london/models/favourite.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/preference.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/utils/favourite.dart';
import 'package:transport_for_london/widgets/favourite_icon_button.dart';
import 'package:transport_for_london/widgets/loading_spinner_scaffold.dart';
import 'package:transport_for_london/widgets/scaffold_future_builder.dart';

class ModeStopPointPage extends StatefulWidget {
  const ModeStopPointPage({
    Key key,
    @required this.modeName,
    @required this.stopPointId,
  }) : super(key: key);

  final String modeName;
  final String stopPointId;

  @override
  State<StatefulWidget> createState() => _ModeStopPointPageState();
}

class _ModeStopPointPageState extends State<ModeStopPointPage> {
  _ModeStopPointPageState() {
    _preferenceService = ServiceLocator().preferenceService;
    _stopPointService = ServiceLocator().stopPointService;
  }

  List<Favourite> _favourites;
  PreferenceService _preferenceService;
  StopPoint _stopPoint;
  StopPointService _stopPointService;

  Widget _buildFavouriteIconButton() {
    Favourite favourite = Favourite(
      name: _stopPoint.commonName,
      path: '/modes/${widget.modeName}/stop_points/${widget.stopPointId}',
    );

    return FavouriteIconButton(
      doFavouritesContainPath(_favourites, favourite.path),
      () async {
        _favourites = toggleFavourite(_favourites, favourite);

        await _preferenceService.setFavourites(_favourites);

        setState(() {});
      },
    );
  }

  Widget _buildModeStopPoint() {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          _buildFavouriteIconButton(),
        ],
        title: Text(_stopPoint.commonName),
      ),
      body: ListView(
        children: <Widget>[
          _buildModeStopPointListTile(
            'Arrivals',
            Icon(Icons.rss_feed),
            '/modes/${widget.modeName}/stop_points/${widget.stopPointId}/arrivals',
          ),
          _buildModeStopPointListTile(
            'Children',
            Icon(Icons.supervisor_account),
            '/modes/${widget.modeName}/stop_points/${widget.stopPointId}/children',
          ),
          _buildModeStopPointListTile(
            'Information',
            Icon(Icons.info),
            '/modes/${widget.modeName}/stop_points/${widget.stopPointId}/additional_properties',
          ),
          _buildModeStopPointListTile(
            'Lines',
            Icon(Icons.reorder),
            '/modes/${widget.modeName}/stop_points/${widget.stopPointId}/lines',
          ),
        ],
      ),
    );
  }

  Widget _buildModeStopPointListTile(String title, Icon icon, String path) {
    return ListTile(
      leading: icon,
      onTap: () => App.router.navigateTo(context, path),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_favourites != null && _stopPoint != null) {
      return _buildModeStopPoint();
    } else {
      return ScaffoldFutureBuilder<List>(
        Future.wait([
          _preferenceService.getFavourites(),
          _stopPointService.getStopPointByStopPointId(widget.stopPointId),
        ]),
        (values) {
          _favourites = values[0];
          _stopPoint = values[1];

          return _buildModeStopPoint();
        },
        LoadingSpinnerScaffold(
          appBar: AppBar(),
        ),
      );
    }
  }
}
