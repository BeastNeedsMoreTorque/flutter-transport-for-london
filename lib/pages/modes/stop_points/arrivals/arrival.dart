import 'package:flutter/material.dart';
import 'package:transport_for_london/locators/service.dart';
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
  State<StatefulWidget> createState() => _ModeStopPointArrivalPageState();
}

class _ModeStopPointArrivalPageState extends State<ModeStopPointArrivalPage> {
  _ModeStopPointArrivalPageState() {
    _stopPointService = ServiceLocator().stopPointService;
  }

  Prediction _arrival;
  StopPointService _stopPointService;

  Widget _buildArrival() {
    return Scaffold(
      appBar: AppBar(
        title: Text(_arrival.vehicleId),
      ),
      body: _buildArrivalListView(),
    );
  }

  Widget _buildArrivalListView() {
    return ListView(
      children: <Widget>[
        ListTile(
          subtitle: SingleLineText(_arrival.lineName),
          title: Text('Line'),
        ),
        ListTile(
          subtitle: SingleLineText(_arrival.platformName),
          title: Text('Platform'),
        ),
        ListTile(
          subtitle: SingleLineText(
            _arrival.expectedArrival
                .toLocal()
                .toIso8601String()
                .substring(11, 16),
          ),
          title: Text('Arrival'),
        ),
        ListTile(
          subtitle: SingleLineText(_arrival.towards),
          title: Text('Destination'),
        ),
        ListTile(
          subtitle: SingleLineText(_arrival.currentLocation),
          title: Text('Location'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_arrival != null) {
      return _buildArrival();
    } else {
      return ScaffoldFutureBuilder<Prediction>(
        _stopPointService.getArrivalByStopPointIdArrivalId(
          widget.stopPointId,
          widget.arrivalId,
        ),
        (arrival) {
          _arrival = arrival;

          return _buildArrival();
        },
        LoadingSpinnerScaffold(
          appBar: AppBar(),
        ),
      );
    }
  }
}
