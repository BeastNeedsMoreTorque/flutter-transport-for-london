import 'package:flutter/material.dart';
import 'package:transport_for_london/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppBar _buildAppBar() {
    return new AppBar(
      title: new Text('Home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      drawer: new DrawerWidget(),
    );
  }
}
