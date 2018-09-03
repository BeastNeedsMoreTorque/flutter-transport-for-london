import 'package:flutter/material.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

class LoadingSpinnerScaffold extends Scaffold {
  LoadingSpinnerScaffold({
    AppBar appBar,
    Key key,
  }) : super(
          appBar: appBar,
          body: LoadingSpinner(),
          key: key,
        );
}
