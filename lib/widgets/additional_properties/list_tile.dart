import 'package:flutter/material.dart';
import 'package:transport_for_london/models/additional_property.dart';
import 'package:transport_for_london/widgets/single_line_text.dart';

class AdditionalPropertyListTile extends ListTile {
  AdditionalPropertyListTile(
    AdditionalProperty additionalProperty, {
    Key key,
  }) : super(
          key: key,
          subtitle: SingleLineText(additionalProperty.value),
          title: SingleLineText(additionalProperty.key),
        );
}
