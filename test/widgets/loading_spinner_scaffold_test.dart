import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';
import 'package:transport_for_london/widgets/loading_spinner_scaffold.dart';

void main() {
  testWidgets('should display app bar', (tester) async {
    await tester.pumpWidget(
      new MaterialApp(
        home: new LoadingSpinnerScaffold(
          appBar: new AppBar(
            title: new Text('TEST'),
          ),
        ),
      ),
    );

    expect(find.text('TEST'), findsOneWidget);
  });

  testWidgets('should display loading spinner', (tester) async {
    await tester.pumpWidget(
      new MaterialApp(
        home: new LoadingSpinnerScaffold(),
      ),
    );

    expect(find.byType(LoadingSpinner), findsOneWidget);
  });
}
