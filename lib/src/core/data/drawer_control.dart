import 'package:flutter/widgets.dart';
import 'package:flutter_game_app/src/core/data/states_drawer._enum.dart';

class DrawerStateNotifier extends ChangeNotifier {
  bool _isOpen = false;
  DrawerStatusApp _statusApp = DrawerStatusApp.start;
  bool get isOpen => _isOpen;
  DrawerStatusApp get drawerStatusApp => _statusApp;

  void changeStatus(DrawerStates state) {
    _isOpen = state == DrawerStates.open ? true : false;
    _statusApp = DrawerStatusApp.run;
    notifyListeners();
  }
}
