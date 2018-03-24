import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/models/additional_property.dart';

class AdditionalPropertyListTileWidget extends StatelessWidget {
  AdditionalPropertyListTileWidget({
    Key key,
    @required this.additionalProperty,
  })
      : super(key: key);

  final AdditionalProperty additionalProperty;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      subtitle: new Text(
        additionalProperty.value,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      title: new Text(
        additionalProperty.key,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
