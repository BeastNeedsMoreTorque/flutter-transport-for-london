import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:transport_for_london/models/configuration.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/stores/stop_point.dart';
import 'package:transport_for_london/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  HomePage(this.configuration);

  final Configuration configuration;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with StoreWatcherMixin<HomePage> {
  StopPointStore _stopPointStore;

  @override
  void initState() {
    super.initState();

    _stopPointStore = listenToStore(stopPointStoreToken);
  }

  AppBar _buildAppBar() {
    return new AppBar(
      title: new Text('Home'),
    );
  }

  Widget _buildHome() {
    return new ListView(
      children: <Widget>[
        _buildStopPointListTile(
          new Icon(Icons.home),
          widget.configuration.home,
        ),
        _buildStopPointListTile(
          new Icon(Icons.work),
          widget.configuration.work,
        ),
      ],
    );
  }

  ListTile _buildStopPointListTile(Icon icon, StopPoint stopPoint) {
    return new ListTile(
      leading: icon,
      onTap: stopPoint != null ? () {
        selectStopPoint(stopPoint).then((_) {
          return Navigator.of(context).pushNamed('/predictions');
        }).then((_) => resetStopPoint());
      } : null,
      title: new Text(
        stopPoint?.commonName ?? 'Unknown',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildHome(),
      drawer: new DrawerWidget(),
    );
  }
}
