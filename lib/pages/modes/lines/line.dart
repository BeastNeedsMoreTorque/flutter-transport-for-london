import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/injectors/dependency.dart';
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
  State<StatefulWidget> createState() => new _ModeLinePageState();
}

class _ModeLinePageState extends State<ModeLinePage> {
  _ModeLinePageState() {
    _lineService = new DependencyInjector().lineService;
    _preferenceService = new DependencyInjector().preferenceService;
  }

  List<Favourite> _favourites;
  Line _line;
  LineService _lineService;
  PreferenceService _preferenceService;

  Widget _buildFavouriteIconButton() {
    Favourite favourite = new Favourite(
      name: _line.name,
      path: '/modes/${widget.modeName}/lines/${widget.lineId}',
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

  Widget _buildModeLine() {
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          _buildFavouriteIconButton(),
        ],
        title: new Text(_line.name),
      ),
      body: new ListView(
        children: <Widget>[
          _buildModeLineListTile(
            'Routes',
            new Icon(Icons.directions),
            '/modes/${widget.modeName}/lines/${widget.lineId}/routes',
          ),
          _buildModeLineListTile(
            'Statuses',
            new Icon(Icons.warning),
            '/modes/${widget.modeName}/lines/${widget.lineId}/statuses',
          ),
          _buildModeLineListTile(
            'Stop Points',
            new Icon(Icons.place),
            '/modes/${widget.modeName}/lines/${widget.lineId}/stop_points',
          ),
        ],
      ),
    );
  }

  Widget _buildModeLineListTile(String title, Icon icon, String path) {
    return new ListTile(
      leading: icon,
      onTap: () => App.router.navigateTo(context, path),
      title: new Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_favourites != null && _line != null) {
      return _buildModeLine();
    } else {
      return new ScaffoldFutureBuilder<List>(
        Future.wait([
          _preferenceService.getFavourites(),
          _lineService.getLineByLineId(widget.lineId),
        ]),
        (values) {
          _favourites = values[0];
          _line = values[1];

          return _buildModeLine();
        },
        new LoadingSpinnerScaffold(
          appBar: new AppBar(),
        ),
      );
    }
  }
}
