import 'package:flutter/material.dart';
import 'package:transport_for_london/locators/service.dart';
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
  State<StatefulWidget> createState() => _ModeStopPointChildrenPageState();
}

class _ModeStopPointChildrenPageState extends State<ModeStopPointChildrenPage> {
  _ModeStopPointChildrenPageState() {
    _stopPointService = ServiceLocator().stopPointService;
  }

  List<StopPoint> _children;
  StopPointService _stopPointService;

  Widget _buildChild(StopPoint child) {
    return child.children.isEmpty
        ? _buildChildListTile(child)
        : _buildChildExpansionTile(child);
  }

  Widget _buildChildExpansionTile(StopPoint child) {
    return ExpansionTile(
      key: PageStorageKey<StopPoint>(child),
      title: SingleLineText(child.commonName),
      children: child.children.map(_buildChild).toList(),
    );
  }

  Widget _buildChildListTile(StopPoint child) {
    return ListTile(
      subtitle: SingleLineText('${child.stopType} - ${child.id}'),
      title: SingleLineText(child.commonName),
    );
  }

  Widget _buildChildren() {
    if (_children != null) {
      return _buildChildrenListView();
    } else {
      return LoadingSpinnerFutureBuilder<StopPoint>(
        _stopPointService.getStopPointByStopPointId(widget.stopPointId),
        (stopPoint) {
          _children = stopPoint.children;

          return _buildChildrenListView();
        },
      );
    }
  }

  Widget _buildChildrenListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _buildChild(_children[index]);
      },
      itemCount: _children.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Children'),
      ),
      body: _buildChildren(),
    );
  }
}
