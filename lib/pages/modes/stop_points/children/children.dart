import 'package:flutter/material.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/services/stop_point.dart';
import 'package:transport_for_london/widgets/loading_spinner_future_builder.dart';
import 'package:transport_for_london/widgets/single_line_text.dart';

class ModeStopPointChildrenPage extends StatefulWidget {
  ModeStopPointChildrenPage({
    Key key,
    @required this.modeName,
    @required this.stopPointId,
  }) : super(key: key);

  final String modeName;
  final String stopPointId;

  @override
  State<StatefulWidget> createState() => new _ModeStopPointChildrenPageState();
}

class _ModeStopPointChildrenPageState extends State<ModeStopPointChildrenPage> {
  _ModeStopPointChildrenPageState() {
    _stopPointService = new DependencyInjector().stopPointService;
  }

  List<StopPoint> _children;
  StopPointService _stopPointService;

  Widget _buildChild(StopPoint child) {
    return child.children.isEmpty
        ? _buildChildListTile(child)
        : _buildChildExpansionTile(child);
  }

  Widget _buildChildExpansionTile(StopPoint child) {
    return new ExpansionTile(
      key: new PageStorageKey<StopPoint>(child),
      title: new SingleLineText(child.commonName),
      children: child.children.map(_buildChild).toList(),
    );
  }

  Widget _buildChildListTile(StopPoint child) {
    return new ListTile(
      subtitle: new SingleLineText('${child.stopType} - ${child.id}'),
      title: new SingleLineText(child.commonName),
    );
  }

  Widget _buildChildren() {
    if (_children != null) {
      return _buildChildrenListView();
    } else {
      return new LoadingSpinnerFutureBuilder<StopPoint>(
        _stopPointService.getStopPointByStopPointId(widget.stopPointId),
        (stopPoint) {
          _children = stopPoint.children;

          return _buildChildrenListView();
        },
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
