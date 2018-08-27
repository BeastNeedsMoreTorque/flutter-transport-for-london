import 'package:flutter/material.dart';
import 'package:transport_for_london/models/configuration.dart';
import 'package:transport_for_london/services/preference.dart';
import 'package:transport_for_london/widgets/drawer.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Configuration configuration;
  PreferenceService preferencesService = new PreferenceService();

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
    return new Center(
      child: new Text('Coming Soon'),
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
