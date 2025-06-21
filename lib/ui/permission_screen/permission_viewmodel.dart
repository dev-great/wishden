import 'package:go_router/go_router.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/navigation/route.dart';
import 'package:stacked/stacked.dart';

class PermissionViewModel extends BaseViewModel {
  int permission = 1;
  toggleAddPermission() {
    if (permission < 3) {
      permission++;
    } else {
      locator<GoRouter>().push(
        AppRoutes.dashboardView,
      );
    }
    notifyListeners();
  }
}
