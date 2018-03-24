import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/stores/stop_point.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';
import 'package:transport_for_london/widgets/prediction_list_tile.dart';
import 'package:transport_for_london/widgets/text_divider.dart';

class PredictionsPage extends StatefulWidget {
  @override
  _PredictionsPageState createState() => new _PredictionsPageState();
}

class _PredictionsPageState extends State<PredictionsPage>
    with StoreWatcherMixin<PredictionsPage> {
  Map<String, List<Prediction>> _predictions = new Map();
  StopPointService _stopPointService = new StopPointService();
  StopPointStore _stopPointStore;

  @override
  void initState() {
    super.initState();

    _stopPointStore = listenToStore(stopPointStoreToken);
  }

  List<Widget> _buildAppBarActions() {
    return [
      new IconButton(
        icon: new Icon(Icons.info),
        onPressed: () {
          Navigator.of(context).pushNamed('/additional_properties');
        },
      ),
    ];
  }

  Text _buildAppBarTitle() {
    return new Text(_stopPointStore.stopPoint.commonName);
  }

  @override
  Widget build(BuildContext context) {
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
      future: _stopPointService.getPredictionsByStopPoint(
        _stopPointStore.stopPoint.naptanId,
      ),
    );
  }
}
