import 'package:flutter/material.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

class StopPointArrivalPage extends StatefulWidget {
  const StopPointArrivalPage({
    Key key,
    @required this.arrivalId,
    @required this.stopPointId,
  }) : super(key: key);

  final String arrivalId;
  final String stopPointId;

  @override
  State<StatefulWidget> createState() => new _StopPointArrivalPageState();
}

class _StopPointArrivalPageState extends State<StopPointArrivalPage> {
  _StopPointArrivalPageState() {
    _stopPointService = new DependencyInjector().stopPointService;
  }

  Prediction _prediction;
  StopPointService _stopPointService;

  Widget _buildArrival() {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_prediction.vehicleId),
      ),
      body: _buildArrivalListView(),
    );
  }

  Widget _buildArrivalListTileSubtitle(String data) {
    return new Text(
      data,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildArrivalListView() {
    return new ListView(
      children: <Widget>[
        new ListTile(
          subtitle: _buildArrivalListTileSubtitle(_prediction.lineName),
          title: new Text('Line'),
        ),
        new ListTile(
          subtitle: _buildArrivalListTileSubtitle(_prediction.platformName),
          title: new Text('Platform'),
        ),
        new ListTile(
          subtitle: _buildArrivalListTileSubtitle(
            _prediction.expectedArrival
                .toLocal()
                .toIso8601String()
                .substring(11, 16),
          ),
          title: new Text('Arrival'),
        ),
        new ListTile(
          subtitle: _buildArrivalListTileSubtitle(_prediction.towards),
          title: new Text('Destination'),
        ),
        new ListTile(
          subtitle: _buildArrivalListTileSubtitle(_prediction.currentLocation),
          title: new Text('Location'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_prediction != null) {
      return _buildArrival();
    } else {
      return new FutureBuilder<Prediction>(
        builder: (
          BuildContext context,
          AsyncSnapshot<Prediction> snapshot,
        ) {
          if (snapshot.hasData) {
            _prediction = snapshot.data;

            return _buildArrival();
          } else {
            return new Scaffold(
              appBar: new AppBar(),
              body: new LoadingSpinnerWidget(),
            );
          }
        },
        future: _stopPointService.getArrivalByStopPointIdArrivalId(
          widget.stopPointId,
          widget.arrivalId,
        ),
      );
    }
  }
}
