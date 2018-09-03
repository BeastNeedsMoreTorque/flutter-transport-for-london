import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transport_for_london/types/callback.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

class LoadingSpinnerFutureBuilder<T> extends FutureBuilder<T> {
  LoadingSpinnerFutureBuilder(
    Future<T> future,
    Callback<Widget, T> onComplete, {
    Key key,
  }) : super(
          builder: (BuildContext context, AsyncSnapshot<T> snapshot) =>
              snapshot.hasData ? onComplete(snapshot.data) : LoadingSpinner(),
          future: future,
          key: key,
        );
}
