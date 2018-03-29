import 'package:flutter/material.dart';
import 'package:transport_for_london/models/disruption.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/widgets/disruption_list_tile.dart';
import 'package:transport_for_london/widgets/drawer.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

class DisruptionsPage extends StatefulWidget {
  @override
  _DisruptionsPageState createState() => new _DisruptionsPageState();
}

class _DisruptionsPageState extends State<DisruptionsPage> {
  _DisruptionsPageState() {
    _disruptionItemBuilder = (BuildContext context, int index) {
      return new DisruptionListTileWidget(
        disruption: _disruptions[index],
      );
    };
  }

  IndexedWidgetBuilder _disruptionItemBuilder;
  List<Disruption> _disruptions = [];
  LineService _lineService = new LineService();

  AppBar _buildAppBar() {
    return new AppBar(
      title: new Text('Disruptions'),
    );
  }

  ListView _buildDisruptionListView() {
    return new ListView.builder(
      itemBuilder: _disruptionItemBuilder,
      itemCount: _disruptions.length,
    );
  }

  Widget _buildDisruptions() {
    return new FutureBuilder<List<Disruption>>(
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Disruption>> snapshot,
      ) {
        if (snapshot.hasData) {
          _disruptions = snapshot.data;

          return _buildDisruptionListView();
        } else {
          return new LoadingSpinnerWidget();
        }
      },
      future: _lineService.getDisruptionsByMode(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildDisruptions(),
      drawer: new DrawerWidget(),
    );
  }
}
