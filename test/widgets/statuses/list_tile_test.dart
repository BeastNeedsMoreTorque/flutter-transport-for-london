import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/widgets/statuses/list_tile.dart';

void main() {
  testWidgets('should display text', (tester) async {
    await tester.pumpWidget(
      new MaterialApp(
        home: new Scaffold(
          body: new Container(
            child: new StatusListTile(
              new LineStatus(
                statusSeverityDescription: 'Good Service',
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Good Service'), findsOneWidget);
  });
}
