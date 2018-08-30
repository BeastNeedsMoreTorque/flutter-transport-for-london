import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_for_london/widgets/single_line_text.dart';

void main() {
  testWidgets('should display text', (tester) async {
    await tester.pumpWidget(
      new MaterialApp(
        home: new Scaffold(
          body: new Container(
            child: new SingleLineText('TEST'),
          ),
        ),
      ),
    );

    expect(find.text('TEST'), findsOneWidget);
  });
}
