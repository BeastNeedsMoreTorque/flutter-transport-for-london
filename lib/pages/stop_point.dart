import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

class StopPointPage extends StatefulWidget {
  StopPointPage({
    Key key,
    @required this.stopPointId,
  }) : super(key: key);

  final String stopPointId;

  @override
  _StopPointPageState createState() => new _StopPointPageState();
}

class _StopPointPageState extends State<StopPointPage> {
  _StopPointPageState() {
    _stopPointService = new DependencyInjector().stopPointService;
  }

  StopPoint _stopPoint;
  StopPointService _stopPointService;

  Widget _buildStopPoint() {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_stopPoint.commonName),
      ),
      body: _buildStopPointListView(),
    );
  }

  Widget _buildStopPointListView() {
    return new ListView(
      children: <Widget>[
        new ListTile(
          leading: new Icon(Icons.rss_feed),
          onTap: () {
            App.router.navigateTo(
              context,
              '/stop_points/${widget.stopPointId}/arrivals',
            );
          },
          title: new Text('Arrivals'),
        ),
        new ListTile(
          leading: new Icon(Icons.supervisor_account),
          onTap: () {
            App.router.navigateTo(
              context,
              '/stop_points/${widget.stopPointId}/children',
            );
          },
          title: new Text('Children'),
        ),
        new ListTile(
          leading: new Icon(Icons.info),
          onTap: () {
            App.router.navigateTo(
              context,
              '/stop_points/${widget.stopPointId}/additional_properties',
            );
          },
          title: new Text('Information'),
        ),
        new ListTile(
          leading: new Icon(Icons.reorder),
          onTap: () {
            App.router.navigateTo(
              context,
              '/stop_points/${widget.stopPointId}/lines',
            );
          },
          title: new Text('Lines'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<StopPoint>(
      builder: (
        BuildContext context,
        AsyncSnapshot<StopPoint> snapshot,
      ) {
        if (snapshot.hasData) {
          _stopPoint = snapshot.data;

          return _buildStopPoint();
        } else {
          return new Scaffold(
            appBar: new AppBar(),
            body: new LoadingSpinnerWidget(),
          );
        }
      },
      future: _stopPointService.getStopPointByStopPointId(widget.stopPointId),
    );
  }
}
