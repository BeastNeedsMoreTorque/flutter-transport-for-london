import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_for_london/models/favourite.dart';
import 'package:transport_for_london/widgets/favourite_list_tile.dart';

void main() {
  testWidgets('should display favourite name', (tester) async {
    Favourite favourite = new Favourite(name: 'Bakerloo');

    await tester.pumpWidget(
      new MaterialApp(
        home: new Scaffold(
          body: new Container(
            child: new FavouriteListTile(favourite),
          ),
        ),
      ),
    );

    expect(find.text(favourite.name), findsOneWidget);
  });
}
