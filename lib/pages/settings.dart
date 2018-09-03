import 'package:flutter/material.dart';
import 'package:transport_for_london/models/configuration.dart';
import 'package:transport_for_london/services/preference.dart';
import 'package:transport_for_london/widgets/drawer.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Configuration configuration;
  PreferenceService preferencesService = PreferenceService();

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Settings'),
    );
  }

  Widget _buildSettings() {
    return FutureBuilder<Configuration>(
      builder: (
        BuildContext context,
        AsyncSnapshot<Configuration> snapshot,
      ) {
        if (snapshot.hasData) {
          configuration = snapshot.data;

          return _buildSettingsScrollView();
        } else {
          return LoadingSpinner();
        }
      },
      future: preferencesService.getConfiguration(),
    );
  }

  Widget _buildSettingsScrollView() {
    return Center(
      child: Text('Coming Soon'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildSettings(),
      drawer: AppDrawer(),
    );
  }
}
