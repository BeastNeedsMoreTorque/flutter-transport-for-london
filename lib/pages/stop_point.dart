import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';
import 'package:transport_for_london/widgets/prediction_list_tile.dart';
import 'package:transport_for_london/widgets/text_divider.dart';

class StopPointPage extends StatefulWidget {
  const StopPointPage({
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

  Map<String, List<Prediction>> _predictions = new Map();
  StopPoint _stopPoint;
  StopPointService _stopPointService;

  List<Widget> _buildAppBarActions() {
    return [
      new IconButton(
        icon: new Icon(Icons.info),
        onPressed: () {
          App.router.navigateTo(
            context,
            '/stop_points/${widget.stopPointId}/additional_properties',
          );
        },
      ),
    ];
  }

  Text _buildAppBarTitle() {
    return new Text(_stopPoint.commonName);
  }

  Widget _buildStopPoint() {
    return new FutureBuilder<List<Prediction>>(
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Prediction>> snapshot,
      ) {
        if (snapshot.hasData) {
          _predictions = groupBy(
            snapshot.data,
            (prediction) => prediction.lineName,
          );

          return new DefaultTabController(
            length: _predictions.length,
            child: new Scaffold(
              appBar: new AppBar(
                actions: _buildAppBarActions(),
                bottom: new TabBar(
                  isScrollable: true,
                  tabs: _predictions.keys.toList().map((key) {
                    return new Tab(text: key);
                  }).toList(),
                ),
                title: _buildAppBarTitle(),
              ),
              body: new TabBarView(
                children: _predictions.values.map((values) {
                  Map<String, List<Prediction>> predictions = groupBy(
                    values,
                    (value) => value.platformName,
                  );

                  return new ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      MapEntry<String, List<Prediction>> entry =
                          predictions.entries.toList()[index];

                      return new Column(
                        children: <Widget>[
                          new TextDividerWidget(text: entry.key),
                          new Column(
                            children: entry.value.map((prediction) {
                              return new PredictionListTileWidget(
                                prediction: prediction,
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    },
                    itemCount: predictions.length,
                  );
                }).toList(),
              ),
            ),
          );
        } else {
          return new Scaffold(
            appBar: new AppBar(
              actions: _buildAppBarActions(),
              title: _buildAppBarTitle(),
            ),
            body: new LoadingSpinnerWidget(),
          );
        }
      },
      future: _stopPointService.getPredictionsByStopPointId(widget.stopPointId),
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
