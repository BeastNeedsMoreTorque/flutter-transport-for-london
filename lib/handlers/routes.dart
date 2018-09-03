import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/pages/bike_points/additional_properties/additional_properties.dart';
import 'package:transport_for_london/pages/bike_points/bike_point.dart';
import 'package:transport_for_london/pages/bike_points/bike_points.dart';
import 'package:transport_for_london/pages/home.dart';
import 'package:transport_for_london/pages/modes/lines/line.dart';
import 'package:transport_for_london/pages/modes/lines/lines.dart';
import 'package:transport_for_london/pages/modes/lines/routes/routes.dart';
import 'package:transport_for_london/pages/modes/lines/statuses/statuses.dart';
import 'package:transport_for_london/pages/modes/lines/stop_points/stop_points.dart';
import 'package:transport_for_london/pages/modes/mode.dart';
import 'package:transport_for_london/pages/modes/modes.dart';
import 'package:transport_for_london/pages/modes/stop_points/additional_properties/additional_properties.dart';
import 'package:transport_for_london/pages/modes/stop_points/arrivals/arrival.dart';
import 'package:transport_for_london/pages/modes/stop_points/arrivals/arrivals.dart';
import 'package:transport_for_london/pages/modes/stop_points/children/children.dart';
import 'package:transport_for_london/pages/modes/stop_points/lines/lines.dart';
import 'package:transport_for_london/pages/modes/stop_points/stop_point.dart';
import 'package:transport_for_london/pages/modes/stop_points/stop_points.dart';
import 'package:transport_for_london/pages/settings.dart';

Handler bikePointHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return BikePointPage(
      bikePointId: params['bikePointId'].first,
    );
  },
);

Handler bikePointAdditionalPropertiesHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return BikePointAdditionalPropertiesPage(
      bikePointId: params['bikePointId'].first,
    );
  },
);

Handler bikePointsHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return BikePointsPage();
  },
);

Handler modeHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return ModePage(
      modeName: params['modeName'].first,
    );
  },
);

Handler modeLineHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return ModeLinePage(
      lineId: params['lineId'].first,
      modeName: params['modeName'].first,
    );
  },
);

Handler modeLineRoutesHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return ModeLineRoutesPage(
      lineId: params['lineId'].first,
      modeName: params['modeName'].first,
    );
  },
);

Handler modeLineStatusesHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return ModeLineStatusesPage(
      lineId: params['lineId'].first,
      modeName: params['modeName'].first,
    );
  },
);

Handler modeLineStopPointsHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return ModeLineStopPointsPage(
      lineId: params['lineId'].first,
      modeName: params['modeName'].first,
    );
  },
);

Handler modeLinesHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return ModeLinesPage(
      modeName: params['modeName'].first,
    );
  },
);

Handler modeStopPointHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return ModeStopPointPage(
      modeName: params['modeName'].first,
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler modeStopPointAdditionalPropertiesHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return ModeStopPointAdditionalPropertiesPage(
      modeName: params['modeName'].first,
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler modeStopPointArrivalHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return ModeStopPointArrivalPage(
      arrivalId: params['arrivalId'].first,
      modeName: params['modeName'].first,
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler modeStopPointArrivalsHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return ModeStopPointArrivalsPage(
      modeName: params['modeName'].first,
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler modeStopPointChildrenHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return ModeStopPointChildrenPage(
      modeName: params['modeName'].first,
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler modeStopPointLinesHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return ModeStopPointLinesPage(
      modeName: params['modeName'].first,
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler modeStopPointsHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return ModeStopPointsPage(
      modeName: params['modeName'].first,
    );
  },
);

Handler modesHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return ModesPage();
  },
);

Handler notFoundHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    print('Route Not Found!');
  },
);

Handler rootHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return HomePage();
  },
);

Handler settingsHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return SettingsPage();
  },
);
