import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';

class ModePage extends StatefulWidget {
  const ModePage({
    Key key,
    @required this.modeName,
  }) : super(key: key);

  final String modeName;

  @override
  State<StatefulWidget> createState() => new _ModePageState();
}

class _ModePageState extends State<ModePage> {
  Widget _buildMode() {
    return new ListView(
      children: <Widget>[
        _buildModeListTile(
          'Lines',
          new Icon(Icons.reorder),
          '/modes/${widget.modeName}/lines',
        ),
        _buildModeListTile(
          'Stop Points',
          new Icon(Icons.place),
          '/modes/${widget.modeName}/stop_points',
        ),
      ],
    );
  }

  Widget _buildModeListTile(String title, Icon icon, String path) {
    return new ListTile(
      leading: icon,
      onTap: () => App.router.navigateTo(context, path),
      title: new Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.modeName),
      ),
      body: _buildMode(),
    );
  }
}
