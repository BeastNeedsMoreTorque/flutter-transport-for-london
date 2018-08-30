import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_for_london/models/additional_property.dart';
import 'package:transport_for_london/widgets/additional_properties/list_tile.dart';

void main() {
  testWidgets('should display text', (tester) async {
    await tester.pumpWidget(
      new MaterialApp(
        home: new Scaffold(
          body: new Container(
            child: new AdditionalPropertyListTile(
              new AdditionalProperty(
                key: 'Toilets',
                value: 'Yes',
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Toilets'), findsOneWidget);
    expect(find.text('Yes'), findsOneWidget);
  });
}
