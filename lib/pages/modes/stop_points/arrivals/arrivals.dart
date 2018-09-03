import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/locators/service.dart';
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
  State<StatefulWidget> createState() => _ModeStopPointArrivalsPageState();
}

class _ModeStopPointArrivalsPageState extends State<ModeStopPointArrivalsPage> {
  _ModeStopPointArrivalsPageState() {
    _stopPointService = ServiceLocator().stopPointService;
  }

  Map<String, List<Prediction>> _arrivals;
  StopPointService _stopPointService;

  Widget _buildArrivals() {
    return DefaultTabController(
      length: _arrivals.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            tabs: _arrivals.keys.toList().map((key) => Tab(text: key)).toList(),
          ),
          title: Text('Arrivals'),
        ),
        body: TabBarView(
          children: _arrivals.values.map((values) {
            List<Widget> slivers = [];

            groupBy(
              values,
              (value) => value.platformName,
            ).entries.toList().forEach((entry) {
              slivers.add(
                SliverToBoxAdapter(
                  child: TextDivider(entry.key),
                ),
              );

              slivers.add(
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return ArrivalListTile(
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

            return CustomScrollView(slivers: slivers);
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
      return ScaffoldFutureBuilder<List<Prediction>>(
        _stopPointService.getArrivalsByStopPointId(widget.stopPointId),
        (arrivals) {
          _arrivals = groupBy(arrivals, (arrival) => arrival.lineName);

          return _buildArrivals();
        },
        LoadingSpinnerScaffold(
          appBar: AppBar(
            title: Text('Arrivals'),
          ),
        ),
      );
    }
  }
}
