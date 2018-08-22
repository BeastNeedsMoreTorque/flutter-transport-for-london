import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/models/stop_point.dart';

class FavouriteStopPointListTileWidget extends StatelessWidget {
  FavouriteStopPointListTileWidget({
    Key key,
    @required this.icon,
    this.onDeleted,
    this.onTap,
    @required this.stopPoint,
  }) : super(key: key);

  final Icon icon;
  final VoidCallback onDeleted;
  final VoidCallback onTap;
  final StopPoint stopPoint;

  Widget _buildTitle() {
    return new Text(
      stopPoint?.commonName ?? 'Unknown',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTrailing() {
    return onDeleted != null
        ? new IconButton(
            icon: new Icon(Icons.delete),
            onPressed: onDeleted,
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: icon,
      onTap: onTap,
      title: _buildTitle(),
      trailing: _buildTrailing(),
    );
  }
}
