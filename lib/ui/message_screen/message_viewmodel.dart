import 'package:stacked/stacked.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/services/local_storage_service.dart';

class MessageViewModel extends BaseViewModel {
  final localStorageService = locator<LocalStorageService>();

  final List<String> items = List.generate(5, (index) => '$index');
}
