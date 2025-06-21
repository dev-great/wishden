import 'package:wishden/ui/reservation_screen/reservation_view.dart';
import 'package:wishden/ui/setting_screen/setting_view.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:wishden/ui/home_screen/home_view.dart';
import 'package:wishden/ui/message_screen/message_view.dart';

class DashboardViewModel extends BaseViewModel implements Initialisable {
  int _currentIndex = 0;
  final glbKey = GlobalKey();
  int get currentIndex => _currentIndex;
  void setIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const ReservationView();
      case 2:
        return const MessageView();
      case 3:
        return const SettingView();
      default:
        return const HomeView();
    }
  }

  void navigateToCart() {
    _currentIndex = 1;
    notifyListeners();
  }

  @override
  void initialise() async {}
}
