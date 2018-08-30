import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/widgets/arrivals/list_tile.dart';

void main() {
  testWidgets('should display text', (tester) async {
    await tester.pumpWidget(
      new MaterialApp(
        home: new Scaffold(
          body: new ListView(
            children: <Widget>[
              new ArrivalListTile(
                new Prediction(
                  towards: 'North Acton',
                ),
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text('North Acton'), findsOneWidget);
  });
}
