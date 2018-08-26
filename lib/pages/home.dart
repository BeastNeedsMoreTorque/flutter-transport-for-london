import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/models/configuration.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/preferences.dart';
import 'package:transport_for_london/widgets/drawer.dart';
import 'package:transport_for_london/widgets/favourite_stop_point_list_tile.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Configuration configuration;
  PreferencesService preferencesService = new PreferencesService();

  AppBar _buildAppBar() {
    return new AppBar(
      title: new Text('Home'),
    );
  }

  Widget _buildHome() {
    return new FutureBuilder<Configuration>(
      builder: (
        BuildContext context,
        AsyncSnapshot<Configuration> snapshot,
      ) {
        if (snapshot.hasData) {
          configuration = snapshot.data;

          return _buildHomeScrollView();
        } else {
          return new LoadingSpinner();
        }
      },
      future: preferencesService.getConfiguration(),
    );
  }

  Widget _buildHomeScrollView() {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverList(
          delegate: new SliverChildListDelegate([
            _buildFavouriteStopPointListTile(
              new Icon(Icons.home),
              configuration.home,
            ),
            _buildFavouriteStopPointListTile(
              new Icon(Icons.work),
              configuration.work,
            ),
          ]),
        ),
      ],
    );
  }

  Widget _buildFavouriteStopPointListTile(Icon icon, StopPoint stopPoint) {
    return new FavouriteStopPointListTile(
      stopPoint,
      icon,
      onTap: stopPoint != null
          ? () => App.router.navigateTo(
                context,
                '/modes/tube/stop_points/${stopPoint.id}',
              )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildHome(),
      drawer: new AppDrawer(),
    );
  }
}
