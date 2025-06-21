import 'package:stacked/stacked.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/services/local_storage_service.dart';

class EventViewModel extends BaseViewModel {
  final localStorageService = locator<LocalStorageService>();

  bool option1 = false;
  bool option2 = false;
  bool option3 = false;
  bool option4 = false;

  String? selectedValue; // To hold the currently selected value
  List<String> items = ["Option 1", "Option 2", "Option 3", "Option 4"];
}
