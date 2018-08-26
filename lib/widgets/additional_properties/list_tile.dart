import 'package:flutter/material.dart';
import 'package:transport_for_london/models/additional_property.dart';
import 'package:transport_for_london/widgets/single_line_text.dart';

class AdditionalPropertyListTile extends ListTile {
  AdditionalPropertyListTile(AdditionalProperty additionalProperty)
      : super(
          subtitle: new SingleLineText(additionalProperty.value),
          title: new SingleLineText(additionalProperty.key),
        );
}
