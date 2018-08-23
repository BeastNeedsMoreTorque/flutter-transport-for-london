import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/pages/stop_point_additional_properties.dart';
import 'package:transport_for_london/pages/disruptions.dart';
import 'package:transport_for_london/pages/edit_favourite_stop_point.dart';
import 'package:transport_for_london/pages/home.dart';
import 'package:transport_for_london/pages/line.dart';
import 'package:transport_for_london/pages/line_statuses.dart';
import 'package:transport_for_london/pages/lines.dart';
import 'package:transport_for_london/pages/stop_point_arrivals.dart';
import 'package:transport_for_london/pages/stop_point.dart';
import 'package:transport_for_london/pages/settings.dart';
import 'package:transport_for_london/pages/stop_point_children.dart';
import 'package:transport_for_london/pages/stop_point_lines.dart';
import 'package:transport_for_london/pages/stop_points.dart';

Handler disruptionsHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new DisruptionsPage();
  },
);

Handler editFavouriteStopPointHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new EditFavouriteStopPointPage(
      stopPointLabel: params['stopPointLabel'].first,
    );
  },
);

Handler lineHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new LinePage(
      lineId: params['lineId'].first,
    );
  },
);

Handler lineStatusesHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new LineStatusesPage(
      lineId: params['lineId'].first,
    );
  },
);

Handler linesHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new LinesPage();
  },
);

Handler notFoundHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    print('Route Not Found!');
  },
);

Handler rootHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new HomePage();
  },
);

Handler settingsHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new SettingsPage();
  },
);

Handler stopPointAdditionalPropertiesHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new StopPointAdditionalPropertiesPage(
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler stopPointArrivalsHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new StopPointArrivalsPage(
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler stopPointChildrenHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new StopPointChildrenPage(
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler stopPointLinesHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new StopPointLinesPage(
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler stopPointHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new StopPointPage(
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler stopPointsHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new StopPointsPage();
  },
);
