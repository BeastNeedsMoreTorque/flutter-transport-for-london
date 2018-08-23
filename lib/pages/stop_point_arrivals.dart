import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';
import 'package:transport_for_london/widgets/prediction_list_tile.dart';
import 'package:transport_for_london/widgets/sliver_text_divider.dart';

class StopPointArrivalsPage extends StatefulWidget {
  StopPointArrivalsPage({
    Key key,
    @required this.stopPointId,
  }) : super(key: key);

  final String stopPointId;

  @override
  _StopPointArrivalsPageState createState() =>
      new _StopPointArrivalsPageState();
}

class _StopPointArrivalsPageState extends State<StopPointArrivalsPage> {
  _StopPointArrivalsPageState() {
    _stopPointService = new DependencyInjector().stopPointService;
  }

  Map<String, List<Prediction>> _predictions = new Map();
  StopPointService _stopPointService;

  Widget _buildPredictions() {
    return new DefaultTabController(
      length: _predictions.length,
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(
            isScrollable: true,
            tabs: _predictions.keys.toList().map((key) {
              return new Tab(text: key);
            }).toList(),
          ),
          title: new Text('Arrivals'),
        ),
        body: new TabBarView(
          children: _predictions.values.map((values) {
            List<Widget> slivers = [];

            groupBy(
              values,
              (value) => value.platformName,
            ).entries.toList().forEach((entry) {
              slivers.add(new SliverTextDividerWidget(
                text: entry.key,
              ));

              slivers.add(new SliverList(
                delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return new PredictionListTileWidget(
                      prediction: entry.value[index],
                    );
                  },
                  childCount: entry.value.length,
                ),
              ));
            });

            return new CustomScrollView(slivers: slivers);
          }).toList(),
        ),
      ),
    );
  }

  Future<List<Prediction>> _getPredictions() {
    return _stopPointService.getPredictionsByStopPointId(widget.stopPointId);
  }

  @override
  Widget build(BuildContext context) {
    if (_predictions.length > 0) {
      return _buildPredictions();
    } else {
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

            return _buildPredictions();
          } else {
            return new Scaffold(
              appBar: new AppBar(
                title: new Text('Arrivals'),
              ),
              body: new LoadingSpinnerWidget(),
            );
          }
        },
        future: _getPredictions(),
      );
    }
  }
}
