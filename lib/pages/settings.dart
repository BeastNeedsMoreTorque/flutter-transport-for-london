import 'package:flutter/material.dart';
import 'package:transport_for_london/models/configuration.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/widgets/drawer.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';
import 'package:transport_for_london/widgets/text_divider.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage(this.configuration, this.updater);

  final Configuration configuration;
  final ValueChanged<Configuration> updater;

  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  StopPointService _stopPointService = new StopPointService();
  List<StopPoint> _stopPoints = [];

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
              _buildStopPointDropdownButton(
                'Home',
                new Icon(Icons.home),
                (home) {
                  widget.updater(
                    widget.configuration.copyWith(
                      home: _stopPoints.firstWhere(
                        (stopPoint) {
                          return stopPoint.commonName == home;
                        },
                      ),
                    ),
                  );
                },
                widget.configuration.home?.commonName,
              ),
              _buildStopPointDropdownButton(
                'Work',
                new Icon(Icons.work),
                (work) {
                  widget.updater(
                    widget.configuration.copyWith(
                      work: _stopPoints.firstWhere(
                        (stopPoint) {
                          return stopPoint.commonName == work;
                        },
                      ),
                    ),
                  );
                },
                widget.configuration.work?.commonName,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettings() {
    if (_stopPoints.length > 0) {
      return _buildSettingListView();
    } else {
      return new FutureBuilder<List<StopPoint>>(
        builder: (
          BuildContext context,
          AsyncSnapshot<List<StopPoint>> snapshot,
        ) {
          if (snapshot.hasData) {
            _stopPoints = snapshot.data;

            return _buildSettingListView();
          } else {
            return new LoadingSpinnerWidget();
          }
        },
        future: _stopPointService.getStopPointsByTypeMode(),
      );
    }
  }

  ListTile _buildStopPointDropdownButton(
    String hint,
    Icon icon,
    ValueChanged<String> onChanged,
    String value,
  ) {
    return new ListTile(
      leading: icon,
      title: new DropdownButton(
        hint: new Text(hint),
        items: _buildStopPointDropdownMenuItems(),
        onChanged: onChanged,
        style: new TextStyle(fontSize: 10.0),
        value: value,
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildStopPointDropdownMenuItems() {
    return _stopPoints.map((stopPoint) {
      return new DropdownMenuItem(
        child: new Text(
          stopPoint.commonName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        value: stopPoint.commonName,
      );
    }).toList();
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
