import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/widgets/lines/list_tile.dart';

void main() {
  testWidgets('should display text', (tester) async {
    await tester.pumpWidget(
      new MaterialApp(
        home: new Scaffold(
          body: new Container(
            child: new LineListTile(
              new Line(
                name: 'Bakerloo',
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Bakerloo'), findsOneWidget);
  });
}
