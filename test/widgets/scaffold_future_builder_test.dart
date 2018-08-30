import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_for_london/widgets/scaffold_future_builder.dart';

void main() {
  testWidgets('should display scaffold', (tester) async {
    await tester.pumpWidget(
      new MaterialApp(
        home: new Scaffold(
          body: new ScaffoldFutureBuilder<String>(
            new Future.delayed(new Duration(seconds: 1), () => 'TEST'),
            (value) => new Text(value),
            new Scaffold(appBar: new AppBar()),
          ),
        ),
      ),
    );

    expect(find.text('TEST'), findsNothing);
    expect(find.byType(AppBar), findsOneWidget);

    await tester.pump(new Duration(seconds: 1));

    expect(find.text('TEST'), findsOneWidget);
    expect(find.byType(AppBar), findsNothing);
  });
}
