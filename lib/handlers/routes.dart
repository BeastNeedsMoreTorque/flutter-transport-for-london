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

Handler bikePointHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new BikePointPage(
      bikePointId: params['bikePointId'].first,
    );
  },
);

Handler bikePointAdditionalPropertiesHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new BikePointAdditionalPropertiesPage(
      bikePointId: params['bikePointId'].first,
    );
  },
);

Handler bikePointsHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new BikePointsPage();
  },
);

Handler modeHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new ModePage(
      modeName: params['modeName'].first,
    );
  },
);

Handler modeLineHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new ModeLinePage(
      lineId: params['lineId'].first,
      modeName: params['modeName'].first,
    );
  },
);

Handler modeLineRoutesHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new ModeLineRoutesPage(
      lineId: params['lineId'].first,
      modeName: params['modeName'].first,
    );
  },
);

Handler modeLineStatusesHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new ModeLineStatusesPage(
      lineId: params['lineId'].first,
      modeName: params['modeName'].first,
    );
  },
);

Handler modeLineStopPointsHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new ModeLineStopPointsPage(
      lineId: params['lineId'].first,
      modeName: params['modeName'].first,
    );
  },
);

Handler modeLinesHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new ModeLinesPage(
      modeName: params['modeName'].first,
    );
  },
);

Handler modeStopPointHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new ModeStopPointPage(
      modeName: params['modeName'].first,
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler modeStopPointAdditionalPropertiesHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new ModeStopPointAdditionalPropertiesPage(
      modeName: params['modeName'].first,
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler modeStopPointArrivalHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new ModeStopPointArrivalPage(
      arrivalId: params['arrivalId'].first,
      modeName: params['modeName'].first,
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler modeStopPointArrivalsHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new ModeStopPointArrivalsPage(
      modeName: params['modeName'].first,
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler modeStopPointChildrenHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new ModeStopPointChildrenPage(
      modeName: params['modeName'].first,
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler modeStopPointLinesHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new ModeStopPointLinesPage(
      modeName: params['modeName'].first,
      stopPointId: params['stopPointId'].first,
    );
  },
);

Handler modeStopPointsHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new ModeStopPointsPage(
      modeName: params['modeName'].first,
    );
  },
);

Handler modesHandler = new Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) {
    return new ModesPage();
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
