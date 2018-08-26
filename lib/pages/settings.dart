import 'package:flutter/material.dart';
import 'package:transport_for_london/models/configuration.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/preferences.dart';
import 'package:transport_for_london/types/callback.dart';
import 'package:transport_for_london/widgets/drawer.dart';
import 'package:transport_for_london/widgets/favourite_stop_point_list_tile.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';
import 'package:transport_for_london/widgets/text_divider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Configuration configuration;
  PreferencesService preferencesService = new PreferencesService();

  AppBar _buildAppBar() {
    return new AppBar(
      title: new Text('Settings'),
    );
  }

  Widget _buildSettings() {
    return new FutureBuilder<Configuration>(
      builder: (
        BuildContext context,
        AsyncSnapshot<Configuration> snapshot,
      ) {
        if (snapshot.hasData) {
          configuration = snapshot.data;

          return _buildSettingsScrollView();
        } else {
          return new LoadingSpinner();
        }
      },
      future: preferencesService.getConfiguration(),
    );
  }

  Widget _buildSettingsScrollView() {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverToBoxAdapter(
          child: new TextDivider('Stop Points'),
        ),
        new SliverList(
          delegate: new SliverChildListDelegate([
            _buildStopPointListTile(
              (stopPoint) {
                preferencesService.setConfiguration(
                  configuration.copyWith(
                    home: stopPoint,
                  ),
                );
              },
              new Icon(Icons.home),
              'Home',
              configuration.home,
            ),
            _buildStopPointListTile(
              (stopPoint) {
                preferencesService.setConfiguration(
                  configuration.copyWith(
                    work: stopPoint,
                  ),
                );
              },
              new Icon(Icons.work),
              'Work',
              configuration.work,
            ),
          ]),
        ),
      ],
    );
  }

  Widget _buildStopPointListTile(
    Callback<void, StopPoint> callback,
    Icon icon,
    String stopPointLabel,
    StopPoint stopPoint,
  ) {
    return new FavouriteStopPointListTile(
      stopPoint,
      icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildSettings(),
      drawer: new AppDrawer(),
    );
  }
}
