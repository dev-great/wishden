import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/helpers/constant/app_local_storage.dart';
import 'package:wishden/models/app_model/app_state_model.dart';
import 'package:wishden/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';

class AppStateService with ListenableServiceMixin {
  final _storage = locator<LocalStorageService>();
  final _state = ReactiveValue<AppState>(AppState());

  AppStateService() {
    listenToReactiveValues([_state]);
  }

  bool get loginState => _state.value.isLogged;
  bool get initialized => _state.value.isInit;
  bool get onboarding => _state.value.isOnboarded;

  set loginState(bool state) {
    _storage.saveDataToDisk(LocalStorageKeys.loginKey, state);
    _state.value.isLogged = state;
    notifyListeners();
  }

  set onboarding(bool value) {
    _storage.saveDataToDisk(LocalStorageKeys.onBoarded, value);
    _state.value.isOnboarded = value;
    notifyListeners();
  }

  set initialized(bool value) {
    _storage.saveDataToDisk(LocalStorageKeys.initializationKey, value);
    _state.value.isInit = value;
    notifyListeners();
  }

  Future<void> onAppStart() async {
    _state.value.isOnboarded =
        _storage.getDataFromDisk(LocalStorageKeys.onBoarded) ?? false;
    _state.value.isInit =
        _storage.getDataFromDisk(LocalStorageKeys.initializationKey) ?? false;
    _state.value.isLogged =
        _storage.getDataFromDisk(LocalStorageKeys.loginKey) ?? false;
    notifyListeners();
  }
}
