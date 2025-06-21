import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:wishden/navigation/go_router.dart';
import 'package:wishden/services/app_state_service.dart';
import 'package:wishden/services/local_storage_service.dart';
import 'package:wishden/ui/dashboard_screen/dashboard_viewmodel.dart';

GetIt locator = GetIt.instance;
Future setUpLocator() async {
  var instance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(instance);
  locator.registerSingleton<GoRouter>(router());
  locator.registerSingleton(AppStateService());
  locator.registerSingleton(DashboardViewModel());
}
