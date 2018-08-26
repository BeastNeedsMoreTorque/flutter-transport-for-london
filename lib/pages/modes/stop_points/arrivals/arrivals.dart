import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/widgets/arrivals/list_tile.dart';
import 'package:transport_for_london/widgets/loading_spinner_scaffold.dart';
import 'package:transport_for_london/widgets/scaffold_future_builder.dart';
import 'package:transport_for_london/widgets/text_divider.dart';

class ModeStopPointArrivalsPage extends StatefulWidget {
  const ModeStopPointArrivalsPage({
    Key key,
    @required this.modeName,
    @required this.stopPointId,
  }) : super(key: key);

  final String modeName;
  final String stopPointId;

  @override
  State<StatefulWidget> createState() => new _ModeStopPointArrivalsPageState();
}

class _ModeStopPointArrivalsPageState extends State<ModeStopPointArrivalsPage> {
  _ModeStopPointArrivalsPageState() {
    _stopPointService = new DependencyInjector().stopPointService;
  }

  Map<String, List<Prediction>> _arrivals;
  StopPointService _stopPointService;

  Widget _buildArrivals() {
    return new DefaultTabController(
      length: _arrivals.length,
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(
            isScrollable: true,
            tabs: _arrivals.keys
                .toList()
                .map((key) => new Tab(text: key))
                .toList(),
          ),
          title: new Text('Arrivals'),
        ),
        body: new TabBarView(
          children: _arrivals.values.map((values) {
            List<Widget> slivers = [];

            groupBy(
              values,
              (value) => value.platformName,
            ).entries.toList().forEach((entry) {
              slivers.add(
                new SliverToBoxAdapter(
                  child: new TextDivider(entry.key),
                ),
              );

              slivers.add(
                new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return new ArrivalListTile(
                        entry.value[index],
                        onTap: () {
                          App.router.navigateTo(
                            context,
                            '/modes/${widget.modeName}/stop_points/${widget.stopPointId}/arrivals/${entry.value[index].id}',
                          );
                        },
                      );
                    },
                    childCount: entry.value.length,
                  ),
                ),
              );
            });

            return new CustomScrollView(slivers: slivers);
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_arrivals != null) {
      return _buildArrivals();
    } else {
      return new ScaffoldFutureBuilder<List<Prediction>>(
        _stopPointService.getArrivalsByStopPointId(widget.stopPointId),
        (arrivals) {
          _arrivals = groupBy(arrivals, (arrival) => arrival.lineName);

          return _buildArrivals();
        },
        new LoadingSpinnerScaffold(
          appBar: new AppBar(
            title: new Text('Arrivals'),
          ),
        ),
      );
    }
  }
}
