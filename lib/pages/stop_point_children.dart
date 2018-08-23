import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

class StopPointChildrenPage extends StatefulWidget {
  StopPointChildrenPage({
    Key key,
    @required this.stopPointId,
  }) : super(key: key);

  final String stopPointId;

  @override
  State<StatefulWidget> createState() => new _StopPointChildrenPageState();
}

class _StopPointChildrenPageState extends State<StopPointChildrenPage> {
  _StopPointChildrenPageState() {
    _stopPointService = new DependencyInjector().stopPointService;
  }

  List<StopPoint> _children = [];
  StopPointService _stopPointService;

  Widget _buildChild(StopPoint child) {
    return child.children.isEmpty
        ? _buildChildListTile(child)
        : _buildChildExpansionTile(child);
  }

  Widget _buildChildExpansionTile(StopPoint child) {
    return new ExpansionTile(
      key: new PageStorageKey<StopPoint>(child),
      title: new Text(
        child.commonName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      children: child.children.map(_buildChild).toList(),
    );
  }

  Widget _buildChildListTile(StopPoint child) {
    return new ListTile(
      subtitle: new Text(
        '${child.stopType} - ${child.id}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      title: new Text(
        child.commonName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildChildren() {
    if (_children.length > 0) {
      return _buildChildrenListView();
    } else {
      return new FutureBuilder<StopPoint>(
        builder: (
          BuildContext context,
          AsyncSnapshot<StopPoint> snapshot,
        ) {
          if (snapshot.hasData) {
            _children = snapshot.data.children;

            return _buildChildrenListView();
          } else {
            return new LoadingSpinnerWidget();
          }
        },
        future: _getStopPoint(),
      );
    }
  }

  Widget _buildChildrenListView() {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _buildChild(_children[index]);
      },
      itemCount: _children.length,
    );
  }

  Future<StopPoint> _getStopPoint() {
    return _stopPointService.getStopPointByStopPointId(widget.stopPointId);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Children'),
      ),
      body: _buildChildren(),
    );
  }
}
