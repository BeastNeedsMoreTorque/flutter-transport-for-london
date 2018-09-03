import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/locators/service.dart';
import 'package:transport_for_london/models/favourite.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/services/preference.dart';
import 'package:transport_for_london/utils/favourite.dart';
import 'package:transport_for_london/widgets/favourite_icon_button.dart';
import 'package:transport_for_london/widgets/loading_spinner_scaffold.dart';
import 'package:transport_for_london/widgets/scaffold_future_builder.dart';

class ModeLinePage extends StatefulWidget {
  const ModeLinePage({
    Key key,
    @required this.lineId,
    @required this.modeName,
  }) : super(key: key);

  final String lineId;
  final String modeName;

  @override
  State<StatefulWidget> createState() => _ModeLinePageState();
}

class _ModeLinePageState extends State<ModeLinePage> {
  _ModeLinePageState() {
    _lineService = ServiceLocator().lineService;
    _preferenceService = ServiceLocator().preferenceService;
  }

  List<Favourite> _favourites;
  Line _line;
  LineService _lineService;
  PreferenceService _preferenceService;

  Widget _buildFavouriteIconButton() {
    Favourite favourite = Favourite(
      name: _line.name,
      path: '/modes/${widget.modeName}/lines/${widget.lineId}',
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

  Widget _buildModeLine() {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          _buildFavouriteIconButton(),
        ],
        title: Text(_line.name),
      ),
      body: ListView(
        children: <Widget>[
          _buildModeLineListTile(
            'Routes',
            Icon(Icons.directions),
            '/modes/${widget.modeName}/lines/${widget.lineId}/routes',
          ),
          _buildModeLineListTile(
            'Statuses',
            Icon(Icons.warning),
            '/modes/${widget.modeName}/lines/${widget.lineId}/statuses',
          ),
          _buildModeLineListTile(
            'Stop Points',
            Icon(Icons.place),
            '/modes/${widget.modeName}/lines/${widget.lineId}/stop_points',
          ),
        ],
      ),
    );
  }

  Widget _buildModeLineListTile(String title, Icon icon, String path) {
    return ListTile(
      leading: icon,
      onTap: () => App.router.navigateTo(context, path),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_favourites != null && _line != null) {
      return _buildModeLine();
    } else {
      return ScaffoldFutureBuilder<List>(
        Future.wait([
          _preferenceService.getFavourites(),
          _lineService.getLineByLineId(widget.lineId),
        ]),
        (values) {
          _favourites = values[0];
          _line = values[1];

          return _buildModeLine();
        },
        LoadingSpinnerScaffold(
          appBar: AppBar(),
        ),
      );
    }
  }
}
