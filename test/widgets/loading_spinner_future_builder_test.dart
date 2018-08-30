import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';
import 'package:transport_for_london/widgets/loading_spinner_future_builder.dart';

void main() {
  testWidgets('should display loading spinner', (tester) async {
    await tester.pumpWidget(
      new MaterialApp(
        home: new Scaffold(
          body: new LoadingSpinnerFutureBuilder<String>(
            new Future.delayed(new Duration(seconds: 1), () => 'TEST'),
            (value) => new Text(value),
          ),
        ),
      ),
    );

    expect(find.text('TEST'), findsNothing);
    expect(find.byType(LoadingSpinner), findsOneWidget);

    await tester.pump(new Duration(seconds: 1));

    expect(find.text('TEST'), findsOneWidget);
    expect(find.byType(LoadingSpinner), findsNothing);
  });
}
