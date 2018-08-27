import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/injectors/dependency.dart';
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
  State<StatefulWidget> createState() => new _ModeStopPointPageState();
}

class _ModeStopPointPageState extends State<ModeStopPointPage> {
  _ModeStopPointPageState() {
    _preferenceService = new DependencyInjector().preferenceService;
    _stopPointService = new DependencyInjector().stopPointService;
  }

  List<Favourite> _favourites;
  PreferenceService _preferenceService;
  StopPoint _stopPoint;
  StopPointService _stopPointService;

  Widget _buildFavouriteIconButton() {
    Favourite favourite = new Favourite(
      name: _stopPoint.commonName,
      path: '/modes/${widget.modeName}/stop_points/${widget.stopPointId}',
    );

    return new FavouriteIconButton(
      doFavouritesContainPath(_favourites, favourite.path),
      () async {
        _favourites = toggleFavourite(_favourites, favourite);

        await _preferenceService.setFavourites(_favourites);

        setState(() {});
      },
    );
  }

  Widget _buildModeStopPoint() {
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          _buildFavouriteIconButton(),
        ],
        title: new Text(_stopPoint.commonName),
      ),
      body: new ListView(
        children: <Widget>[
          _buildModeStopPointListTile(
            'Arrivals',
            new Icon(Icons.rss_feed),
            '/modes/${widget.modeName}/stop_points/${widget.stopPointId}/arrivals',
          ),
          _buildModeStopPointListTile(
            'Children',
            new Icon(Icons.supervisor_account),
            '/modes/${widget.modeName}/stop_points/${widget.stopPointId}/children',
          ),
          _buildModeStopPointListTile(
            'Information',
            new Icon(Icons.info),
            '/modes/${widget.modeName}/stop_points/${widget.stopPointId}/additional_properties',
          ),
          _buildModeStopPointListTile(
            'Lines',
            new Icon(Icons.reorder),
            '/modes/${widget.modeName}/stop_points/${widget.stopPointId}/lines',
          ),
        ],
      ),
    );
  }

  Widget _buildModeStopPointListTile(String title, Icon icon, String path) {
    return new ListTile(
      leading: icon,
      onTap: () => App.router.navigateTo(context, path),
      title: new Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_favourites != null && _stopPoint != null) {
      return _buildModeStopPoint();
    } else {
      return new ScaffoldFutureBuilder<List>(
        Future.wait([
          _preferenceService.getFavourites(),
          _stopPointService.getStopPointByStopPointId(widget.stopPointId),
        ]),
        (values) {
          _favourites = values[0];
          _stopPoint = values[1];

          return _buildModeStopPoint();
        },
        new LoadingSpinnerScaffold(
          appBar: new AppBar(),
        ),
      );
    }
  }
}
