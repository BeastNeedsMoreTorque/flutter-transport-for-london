import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/locators/service.dart';
import 'package:transport_for_london/models/place.dart';
import 'package:transport_for_london/services/bike_point.dart';
import 'package:transport_for_london/widgets/bike_points/list_tile.dart';
import 'package:transport_for_london/widgets/drawer.dart';
import 'package:transport_for_london/widgets/loading_spinner_future_builder.dart';

class BikePointsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BikePointsPageState();
}

class _BikePointsPageState extends State<BikePointsPage> {
  _BikePointsPageState() {
    _bikePointService = ServiceLocator().bikePointService;
  }

  BikePointService _bikePointService;
  List<Place> _bikePoints;

  Widget _buildBikePoints() {
    if (_bikePoints != null) {
      return _buildBikePointsListView();
    } else {
      return LoadingSpinnerFutureBuilder(
        _bikePointService.getBikePoints(),
        (bikePoints) {
          _bikePoints = bikePoints;

          return _buildBikePointsListView();
        },
      );
    }
  }

  Widget _buildBikePointsListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return BikePointListTile(
          _bikePoints[index],
          onTap: () {
            App.router.navigateTo(
              context,
              '/bike_points/${_bikePoints[index].id}',
            );
          },
        );
      },
      itemCount: _bikePoints.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bike Points'),
      ),
      body: _buildBikePoints(),
      drawer: AppDrawer(),
    );
  }
}
