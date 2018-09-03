import 'package:test/test.dart';
import 'package:transport_for_london/locators/service.dart';
import 'package:transport_for_london/mappings/line.dart';
import 'package:transport_for_london/mappings/stop_point.dart';
import 'package:transport_for_london/models/disruption.dart';
import 'package:transport_for_london/models/favourite.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/models/matched_route.dart';
import 'package:transport_for_london/models/mode.dart';
import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/utils/favourite.dart';
import 'package:transport_for_london/utils/stop_point.dart';

void main() {
  group('locators', () {
    group('service', () {
      test('singleton', () {
        expect(new ServiceLocator(), new ServiceLocator());
      });
    });
  });

  group('mappings', () {
    group('line', () {
      test('mapToDisruption', () {
        Disruption actual = mapToDisruption(
          {'category': 'Information'},
        );
        expect(actual, new TypeMatcher<Disruption>());
        expect(actual.category, 'Information');
      });

      test('mapToDisruptions', () {
        List<Disruption> actual = mapToDisruptions([
          {'category': 'RealTime'},
        ]);
        expect(actual, new TypeMatcher<List<Disruption>>());
        expect(actual.first.category, 'RealTime');
      });

      test('mapToLine', () {
        Line actual = mapToLine(
          {'id': 'bakerloo'},
        );
        expect(actual, new TypeMatcher<Line>());
        expect(actual.id, 'bakerloo');
      });

      test('mapToLines', () {
        List<Line> actual = mapToLines([
          {'id': 'central'},
        ]);
        expect(actual, new TypeMatcher<List<Line>>());
        expect(actual.first.id, 'central');
      });

      test('mapToMode', () {
        Mode actual = mapToMode(
          {'modeName': 'tube'},
        );
        expect(actual, new TypeMatcher<Mode>());
        expect(actual.modeName, 'tube');
      });

      test('mapToModes', () {
        List<Mode> actual = mapToModes([
          {'modeName': 'bus'},
        ]);
        expect(actual, new TypeMatcher<List<Mode>>());
        expect(actual.first.modeName, 'bus');
      });

      test('mapToRoute', () {
        MatchedRoute actual = mapToRoute(
          {'direction': 'inbound'},
        );
        expect(actual, new TypeMatcher<MatchedRoute>());
        expect(actual.direction, 'inbound');
      });

      test('mapToRoutes', () {
        List<MatchedRoute> actual = mapToRoutes([
          {'direction': 'outbound'},
        ]);
        expect(actual, new TypeMatcher<List<MatchedRoute>>());
        expect(actual.first.direction, 'outbound');
      });

      test('mapToStatuses', () {
        List<LineStatus> actual = mapToStatuses(
          {'lineStatuses': []},
        );
        expect(actual, new TypeMatcher<List<LineStatus>>());
        expect(actual, isEmpty);
      });
    });

    group('stop_point', () {
      test('mapToPrediction', () {
        Prediction actual = mapToPrediction(
          {'lineId': 'bakerloo'},
        );
        expect(actual, new TypeMatcher<Prediction>());
        expect(actual.lineId, 'bakerloo');
      });

      test('mapToPredictions', () {
        List<Prediction> actual = mapToPredictions([
          {'lineId': 'central'},
        ]);
        expect(actual, new TypeMatcher<List<Prediction>>());
        expect(actual.first.lineId, 'central');
      });

      test('mapToStopPoint', () {
        StopPoint actual = mapToStopPoint(
          {'id': '940GZZLUACT'},
        );
        expect(actual, new TypeMatcher<StopPoint>());
        expect(actual.id, '940GZZLUACT');
      });

      test('mapToStopPoints', () {
        List<StopPoint> actual = mapToStopPoints([
          {'id': '940GZZLUNAN'},
        ]);
        expect(actual, new TypeMatcher<List<StopPoint>>());
        expect(actual.first.id, '940GZZLUNAN');
      });
    });
  });

  group('utils', () {
    group('favourite', () {
      Favourite actonTown = new Favourite(
        name: 'Acton Town',
        path: '/modes/tube/stop_points/940GZZLUACT',
      );
      Favourite northActon = new Favourite(
        name: 'North Acton',
        path: '/modes/tube/stop_points/940GZZLUNAN',
      );

      List<Favourite> favourites = [actonTown, northActon];

      test('doFavouritesContainName', () {
        bool actual;

        actual = doFavouritesContainName(favourites, 'Acton Town');
        expect(actual, isTrue);

        actual = doFavouritesContainName(favourites, 'Acton Central');
        expect(actual, isFalse);
      });

      test('doFavouritesContainPath', () {
        bool actual;

        actual = doFavouritesContainPath(
          favourites,
          '/modes/tube/stop_points/940GZZLUACT',
        );
        expect(actual, isTrue);

        actual = doFavouritesContainPath(
          favourites,
          '/modes/tube/stop_points/910GACTNCTL',
        );
        expect(actual, isFalse);
      });

      test('toggleFavourite', () {
        List<Favourite> actual;

        actual = toggleFavourite(favourites, actonTown);
        expect(actual, <Favourite>[northActon]);

        actual = toggleFavourite(favourites, actonTown);
        expect(actual, <Favourite>[northActon, actonTown]);
      });
    });

    group('stop_point', () {
      test('doesStopPointCommonNameContainQuery', () {
        bool actual;

        actual = doesStopPointCommonNameContainQuery(
          new StopPoint(commonName: 'Acton Town'),
          'Acton',
        );
        expect(actual, isTrue);

        actual = doesStopPointCommonNameContainQuery(
          new StopPoint(commonName: 'Acton Town'),
          'Central',
        );
        expect(actual, isFalse);
      });

      test('sortPredictions', () {
        int actual;

        actual = sortPredictions(
          new Prediction(
            lineName: 'Bakerloo',
            platformName: 'Northbound - Platform 1',
            expectedArrival: new DateTime(1, 1, 1, 0, 0),
          ),
          new Prediction(
            lineName: 'Bakerloo',
            platformName: 'Northbound - Platform 1',
            expectedArrival: new DateTime(1, 1, 1, 0, 5),
          ),
        );
        expect(actual, isNegative);

        actual = sortPredictions(
          new Prediction(
            lineName: 'Bakerloo',
            platformName: 'Southbound - Platform 2',
            expectedArrival: new DateTime(1, 1, 1, 0, 0),
          ),
          new Prediction(
            lineName: 'Bakerloo',
            platformName: 'Northbound - Platform 1',
            expectedArrival: new DateTime(1, 1, 1, 0, 0),
          ),
        );
        expect(actual, isPositive);
      });

      test('sortStopPoints', () {
        int actual;

        actual = sortStopPoints(
          new StopPoint(commonName: 'Acton Central'),
          new StopPoint(commonName: 'Acton Town'),
        );
        expect(actual, isNegative);

        actual = sortStopPoints(
          new StopPoint(commonName: 'West Acton'),
          new StopPoint(commonName: 'North Acton'),
        );
        expect(actual, isPositive);
      });
    });
  });
}
