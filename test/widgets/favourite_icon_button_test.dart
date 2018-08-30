import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_for_london/widgets/favourite_icon_button.dart';

void main() {
  testWidgets('should display favourite icon', (tester) async {
    bool isFavourite = true;

    await tester.pumpWidget(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return new MaterialApp(
            home: new Scaffold(
              body: new Container(
                child: new FavouriteIconButton(
                  isFavourite,
                  () => setState(() => isFavourite = !isFavourite),
                ),
              ),
            ),
          );
        },
      ),
    );

    expect(find.byIcon(Icons.favorite), findsOneWidget);

    await tester.tap(find.byType(FavouriteIconButton));
    await tester.pump();

    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
  });
}
