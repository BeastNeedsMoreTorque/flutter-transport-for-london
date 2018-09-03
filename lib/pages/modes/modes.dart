import 'package:flutter/material.dart';
import 'package:transport_for_london/config/app.dart';
import 'package:transport_for_london/locators/service.dart';
import 'package:transport_for_london/models/mode.dart';
import 'package:transport_for_london/services/line.dart';
import 'package:transport_for_london/widgets/drawer.dart';
import 'package:transport_for_london/widgets/loading_spinner_future_builder.dart';

class ModesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ModesPageState();
}

class _ModesPageState extends State<ModesPage> {
  _ModesPageState() {
    _lineService = ServiceLocator().lineService;
  }

  LineService _lineService;
  List<Mode> _modes;

  Widget _buildModes() {
    if (_modes != null) {
      return _buildModesListView();
    } else {
      return LoadingSpinnerFutureBuilder<List<Mode>>(
        _lineService.getLineModes(),
        (modes) {
          _modes = modes;

          return _buildModesListView();
        },
      );
    }
  }

  Widget _buildModesListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            App.router.navigateTo(
              context,
              '/modes/${_modes[index].modeName}',
            );
          },
          title: Text(_modes[index].modeName),
        );
      },
      itemCount: _modes.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modes'),
      ),
      body: _buildModes(),
      drawer: AppDrawer(),
    );
  }
}
