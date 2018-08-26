import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transport_for_london/types/callback.dart';

class ScaffoldFutureBuilder<T> extends FutureBuilder<T> {
  ScaffoldFutureBuilder(
    Future<T> future,
    Callback<Widget, T> onComplete,
    Scaffold scaffold, {
    Key key,
  }) : super(
          builder: (BuildContext context, AsyncSnapshot<T> snapshot) =>
              snapshot.hasData ? onComplete(snapshot.data) : scaffold,
          future: future,
          key: key,
        );
}
