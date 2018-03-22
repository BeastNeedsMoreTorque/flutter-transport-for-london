import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/models/page.dart';

class DrawerPageWidget extends StatefulWidget {
  DrawerPageWidget({
    Key key,
    @required this.onTap,
    @required this.page,
  })
      : super(key: key);

  final VoidCallback onTap;
  final Page page;

  @override
  _DrawerPageWidgetState createState() => new _DrawerPageWidgetState();
}

class _DrawerPageWidgetState extends State<DrawerPageWidget> {
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: widget.page.icon,
      onTap: widget.onTap,
      title: new Text(widget.page.title),
    );
  }
}
