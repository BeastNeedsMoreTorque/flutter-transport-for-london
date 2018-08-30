import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_for_london/models/matched_route.dart';
import 'package:transport_for_london/widgets/routes/list_tile.dart';

void main() {
  testWidgets('should display text', (tester) async {
    await tester.pumpWidget(
      new MaterialApp(
        home: new Scaffold(
          body: new Container(
            child: new RouteListTile(
              new MatchedRoute(
                originationName: 'North Acton Underground Station',
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('North Acton Underground Station'), findsOneWidget);
  });
}
