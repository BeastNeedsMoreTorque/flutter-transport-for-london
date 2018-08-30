import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/widgets/modes/stop_points/list_tile.dart';

void main() {
  testWidgets('should display text', (tester) async {
    await tester.pumpWidget(
      new MaterialApp(
        home: new Scaffold(
          body: new Container(
            child: new ModeStopPointListTile(
              new StopPoint(
                commonName: 'Acton Town Underground Station',
                stopType: 'NaptanMetroStation',
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Acton Town Underground Station'), findsOneWidget);
  });
}
