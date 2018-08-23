import 'package:flutter/material.dart';
import 'package:transport_for_london/widgets/text_divider.dart';

class SliverTextDividerWidget extends StatelessWidget {
  SliverTextDividerWidget({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return new SliverToBoxAdapter(
      child: new TextDividerWidget(text: text),
    );
  }
}
