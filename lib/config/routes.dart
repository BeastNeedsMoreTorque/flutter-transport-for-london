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
      '/disruptions',
      handler: disruptionsHandler,
    );

    router.define(
      '/lines',
      handler: linesHandler,
    );
    router.define(
      '/lines/:lineId',
      handler: lineHandler,
    );
    router.define(
      '/lines/:lineId/statuses',
      handler: lineStatusesHandler,
    );

    router.define(
      '/settings',
      handler: settingsHandler,
    );

    router.define(
      '/stop_points',
      handler: stopPointsHandler,
    );
    router.define(
      '/stop_points/:stopPointId',
      handler: stopPointHandler,
    );
    router.define(
      '/stop_points/:stopPointId/additional_properties',
      handler: stopPointAdditionalPropertiesHandler,
    );
    router.define(
      '/stop_points/favourites/:stopPointLabel/edit',
      handler: editFavouriteStopPointHandler,
    );
  }
}
