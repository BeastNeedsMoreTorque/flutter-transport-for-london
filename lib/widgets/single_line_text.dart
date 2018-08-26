import 'package:flutter/material.dart';

class SingleLineText extends Text {
  SingleLineText(
    String data, {
    Key key,
  }) : super(
          data,
          key: key,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        );
}
