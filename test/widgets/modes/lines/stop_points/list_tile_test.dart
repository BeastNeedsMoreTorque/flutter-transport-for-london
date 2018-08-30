import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_for_london/models/identifier.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/widgets/modes/lines/stop_points/list_tile.dart';

void main() {
  testWidgets('should display text', (tester) async {
    await tester.pumpWidget(
      new MaterialApp(
        home: new Scaffold(
          body: new Container(
            child: new ModeLineStopPointListTile(
              new StopPoint(
                commonName: 'North Acton Underground Station',
                lines: [
                  new Identifier(
                    name: 'Central',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Central'), findsOneWidget);
  });
}
