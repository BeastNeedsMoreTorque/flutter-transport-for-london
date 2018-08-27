import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/injectors/dependency.dart';
import 'package:transport_for_london/models/favourite.dart';
import 'package:transport_for_london/services/preference.dart';
import 'package:transport_for_london/widgets/drawer.dart';
import 'package:transport_for_london/widgets/favourite_list_tile.dart';
import 'package:transport_for_london/widgets/loading_spinner.dart';
import 'package:transport_for_london/widgets/text_divider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState() {
    _preferenceService = new DependencyInjector().preferenceService;
  }

  List<Favourite> _favourites;
  PreferenceService _preferenceService;

  AppBar _buildAppBar() {
    return new AppBar(
      title: new Text('Home'),
    );
  }

  Widget _buildHome() {
    return new FutureBuilder<List<Favourite>>(
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Favourite>> snapshot,
      ) {
        if (snapshot.hasData) {
          _favourites = snapshot.data;

          return _buildHomeScrollView();
        } else {
          return new LoadingSpinner();
        }
      },
      future: _preferenceService.getFavourites(),
    );
  }

  Widget _buildHomeScrollView() {
    if (_favourites.length > 0) {
      return new CustomScrollView(
        slivers: <Widget>[
          new SliverToBoxAdapter(
            child: new TextDivider('Favourites'),
          ),
          new SliverList(
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new FavouriteListTile(
                  _favourites[index],
                  onTap: () {
                    App.router.navigateTo(
                      context,
                      _favourites[index].path,
                    );
                  },
                );
              },
              childCount: _favourites.length,
            ),
          ),
        ],
      );
    } else {
      return new Center(
        child: new Text('Welcome'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildHome(),
      drawer: new AppDrawer(),
    );
  }
}
