import 'package:stacked/stacked.dart';

class ReservationDetailedViewModel extends BaseViewModel {
  bool dropDown = true;
  toggleDropDown() {
    dropDown = !dropDown;
  }
}
