import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';

void main() {
  testWidgets('should display centre aligned spinner', (tester) async {
    await tester.pumpWidget(
      new MaterialApp(
        home: new Scaffold(
          body: new Container(
            child: new LoadingSpinner(),
          ),
        ),
      ),
    );

    expect(find.byType(Center), findsOneWidget);
  });
}
