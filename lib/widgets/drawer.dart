import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/models/page.dart';

class AppDrawer extends Drawer {
  AppDrawer({Key key})
      : super(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: _pages[index].icon,
                onTap: () {
                  App.router.navigateTo(
                    context,
                    _pages[index].route,
                  );
                },
                title: Text(_pages[index].title),
              );
            },
            itemCount: _pages.length,
          ),
          key: key,
        );

  static final List<Page> _pages = [
    Page(
      icon: Icon(Icons.home),
      route: '/',
      title: 'Home',
    ),
    Page(
      icon: Icon(Icons.transfer_within_a_station),
      route: '/modes',
      title: 'Modes',
    ),
    Page(
      icon: Icon(Icons.directions_bike),
      route: '/bike_points',
      title: 'Bike Points',
    ),
    Page(
      icon: Icon(Icons.settings),
      route: '/settings',
      title: 'Settings',
    ),
  ];
}
