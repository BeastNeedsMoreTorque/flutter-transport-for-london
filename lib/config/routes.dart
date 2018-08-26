import 'package:fluro/fluro.dart';
import 'package:transport_for_london/handlers/routes.dart';

class Routes {
  static void configureRoutes(Router router) {
    router.notFoundHandler = notFoundHandler;

    router.define(
      '/',
      handler: rootHandler,
    );

    router.define(
      '/modes',
      handler: modesHandler,
    );
    router.define(
      '/modes/:modeName',
      handler: modeHandler,
    );
    router.define(
      '/modes/:modeName/lines',
      handler: modeLinesHandler,
    );
    router.define(
      '/modes/:modeName/lines/:lineId',
      handler: modeLineHandler,
    );
    router.define(
      '/modes/:modeName/lines/:lineId/routes',
      handler: modeLineRoutesHandler,
    );
    router.define(
      '/modes/:modeName/lines/:lineId/statuses',
      handler: modeLineStatusesHandler,
    );
    router.define(
      '/modes/:modeName/lines/:lineId/stop_points',
      handler: modeLineStopPointsHandler,
    );
    router.define(
      '/modes/:modeName/stop_points',
      handler: modeStopPointsHandler,
    );
    router.define(
      '/modes/:modeName/stop_points/:stopPointId',
      handler: modeStopPointHandler,
    );
    router.define(
      '/modes/:modeName/stop_points/:stopPointId/additional_properties',
      handler: modeStopPointAdditionalPropertiesHandler,
    );
    router.define(
      '/modes/:modeName/stop_points/:stopPointId/arrivals',
      handler: modeStopPointArrivalsHandler,
    );
    router.define(
      '/modes/:modeName/stop_points/:stopPointId/arrivals/:arrivalId',
      handler: modeStopPointArrivalHandler,
    );
    router.define(
      '/modes/:modeName/stop_points/:stopPointId/children',
      handler: modeStopPointChildrenHandler,
    );
    router.define(
      '/modes/:modeName/stop_points/:stopPointId/lines',
      handler: modeStopPointLinesHandler,
    );

    router.define(
      '/settings',
      handler: settingsHandler,
    );
  }
}
