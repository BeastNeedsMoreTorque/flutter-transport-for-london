import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';

class ModePage extends StatefulWidget {
  const ModePage({
    Key key,
    @required this.modeName,
  }) : super(key: key);

  final String modeName;

  @override
  State<StatefulWidget> createState() => _ModePageState();
}

class _ModePageState extends State<ModePage> {
  Widget _buildMode() {
    return ListView(
      children: <Widget>[
        _buildModeListTile(
          'Lines',
          Icon(Icons.reorder),
          '/modes/${widget.modeName}/lines',
        ),
        _buildModeListTile(
          'Stop Points',
          Icon(Icons.place),
          '/modes/${widget.modeName}/stop_points',
        ),
      ],
    );
  }

  Widget _buildModeListTile(String title, Icon icon, String path) {
    return ListTile(
      leading: icon,
      onTap: () => App.router.navigateTo(context, path),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.modeName),
      ),
      body: _buildMode(),
    );
  }
}
