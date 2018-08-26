import 'package:flutter/material.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/widgets/loading_spinner_scaffold.dart';
import 'package:transport_for_london/widgets/scaffold_future_builder.dart';
import 'package:transport_for_london/widgets/single_line_text.dart';

class ModeStopPointArrivalPage extends StatefulWidget {
  const ModeStopPointArrivalPage({
    Key key,
    @required this.arrivalId,
    @required this.modeName,
    @required this.stopPointId,
  }) : super(key: key);

  final String arrivalId;
  final String modeName;
  final String stopPointId;

  @override
  State<StatefulWidget> createState() => new _ModeStopPointArrivalPageState();
}

class _ModeStopPointArrivalPageState extends State<ModeStopPointArrivalPage> {
  _ModeStopPointArrivalPageState() {
    _stopPointService = new DependencyInjector().stopPointService;
  }

  Prediction _arrival;
  StopPointService _stopPointService;

  Widget _buildArrival() {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_arrival.vehicleId),
      ),
      body: _buildArrivalListView(),
    );
  }

  Widget _buildArrivalListView() {
    return new ListView(
      children: <Widget>[
        new ListTile(
          subtitle: new SingleLineText(_arrival.lineName),
          title: new Text('Line'),
        ),
        new ListTile(
          subtitle: new SingleLineText(_arrival.platformName),
          title: new Text('Platform'),
        ),
        new ListTile(
          subtitle: new SingleLineText(
            _arrival.expectedArrival
                .toLocal()
                .toIso8601String()
                .substring(11, 16),
          ),
          title: new Text('Arrival'),
        ),
        new ListTile(
          subtitle: new SingleLineText(_arrival.towards),
          title: new Text('Destination'),
        ),
        new ListTile(
          subtitle: new SingleLineText(_arrival.currentLocation),
          title: new Text('Location'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_arrival != null) {
      return _buildArrival();
    } else {
      return new ScaffoldFutureBuilder<Prediction>(
        _stopPointService.getArrivalByStopPointIdArrivalId(
          widget.stopPointId,
          widget.arrivalId,
        ),
        (arrival) {
          _arrival = arrival;

          return _buildArrival();
        },
        new LoadingSpinnerScaffold(
          appBar: new AppBar(),
        ),
      );
    }
  }
}