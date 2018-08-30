import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_for_london/widgets/drawer.dart';

void main() {
  testWidgets('should display pages', (tester) async {
    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

    await tester.pumpWidget(
      new MaterialApp(
        home: new Scaffold(
          body: new Container(),
          drawer: new AppDrawer(),
          key: scaffoldKey,
        ),
      ),
    );

    expect(find.byType(ListTile), findsNothing);
    expect(find.text('Home'), findsNothing);

    scaffoldKey.currentState.openDrawer();
    await tester.pump();

    expect(find.byType(ListTile), findsWidgets);
    expect(find.text('Home'), findsOneWidget);
  });
}
