import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:transport_for_london/models/configuration.dart';
import 'package:transport_for_london/stores/configuration.dart';
import 'package:transport_for_london/stores/stop_point.dart';
import 'package:transport_for_london/widgets/drawer.dart';
import 'package:transport_for_london/widgets/text_divider.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage(this.configuration, this.updater);

  final Configuration configuration;
  final ValueChanged<Configuration> updater;

  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with StoreWatcherMixin<SettingsPage> {
  ConfigurationStore _configurationStore;
  StopPointStore _stopPointStore;

  @override
  void initState() {
    super.initState();

    _configurationStore = listenToStore(configurationStoreToken);
    _stopPointStore = listenToStore(stopPointStoreToken);
  }

  AppBar _buildAppBar() {
    return new AppBar(
      title: new Text('Settings'),
    );
  }

  ListView _buildSettingListView() {
    return new ListView(
      children: <Widget>[
        new TextDividerWidget(text: 'Stop Points'),
        new Container(
          child: new Column(
            children: <Widget>[
              _buildStopPointListTile(
                () {
                  widget.updater(
                    widget.configuration.copyWith(
                      home: _stopPointStore.stopPoint,
                    ),
                  );

                  resetStopPoint();
                  resetStopPointBeingEdited();
                },
                new Icon(Icons.home),
                'Home',
                widget.configuration.home?.commonName ?? 'Unknown',
              ),
              _buildStopPointListTile(
                () {
                  widget.updater(
                    widget.configuration.copyWith(
                      work: _stopPointStore.stopPoint,
                    ),
                  );

                  resetStopPoint();
                  resetStopPointBeingEdited();
                },
                new Icon(Icons.work),
                'Work',
                widget.configuration.work?.commonName ?? 'Unknown',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettings() {
    return _buildSettingListView();
  }

  ListTile _buildStopPointListTile(
    VoidCallback callback,
    Icon icon,
    String stopPointBeingEdited,
    String title,
  ) {
    return new ListTile(
      leading: icon,
      onTap: () {
        selectStopPointBeingEdited(stopPointBeingEdited).then((_) {
          return Navigator.of(context).pushNamed('/stop_points');
        }).then((_) => callback());
      },
      title: new Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildSettings(),
      drawer: new DrawerWidget(),
    );
  }
}
