import 'package:flutter/material.dart';
import 'package:transport_for_london/models/page.dart';
import 'package:transport_for_london/widgets/drawer_page.dart';

class DrawerWidget extends StatelessWidget {
  final List<Page> _pages = [
    new Page(
      icon: new Icon(Icons.home),
      route: '/',
      title: 'Home',
    ),
    new Page(
      icon: new Icon(Icons.reorder),
      route: '/lines',
      title: 'Lines',
    ),
    new Page(
      icon: new Icon(Icons.warning),
      route: '/disruptions',
      title: 'Disruptions',
    ),
    new Page(
      icon: new Icon(Icons.place),
      route: '/stop_points',
      title: 'Stop Points',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: _pages.map((Page page) {
          return new DrawerPageWidget(
            onTap: () => Navigator.of(context).pushNamed(page.route),
            page: page,
          );
        }).toList(),
      ),
    );
  }
}
