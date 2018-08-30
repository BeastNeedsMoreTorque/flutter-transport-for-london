import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/models/page.dart';

class AppDrawer extends Drawer {
  AppDrawer({Key key})
      : super(
          child: new ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return new ListTile(
                leading: _pages[index].icon,
                onTap: () {
                  App.router.navigateTo(
                    context,
                    _pages[index].route,
                  );
                },
                title: new Text(_pages[index].title),
              );
            },
            itemCount: _pages.length,
          ),
          key: key,
        );

  static final List<Page> _pages = [
    new Page(
      icon: new Icon(Icons.home),
      route: '/',
      title: 'Home',
    ),
    new Page(
      icon: new Icon(Icons.transfer_within_a_station),
      route: '/modes',
      title: 'Modes',
    ),
    new Page(
      icon: new Icon(Icons.settings),
      route: '/settings',
      title: 'Settings',
    ),
  ];
}
