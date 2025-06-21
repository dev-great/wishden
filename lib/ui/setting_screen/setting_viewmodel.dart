import 'package:stacked/stacked.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/services/local_storage_service.dart';

class SettingViewModel extends BaseViewModel {
  final localStorageService = locator<LocalStorageService>();
  bool switchValue = true;
  toggleSettings(bool value) {
    switchValue = value;
    notifyListeners();
  }
}
