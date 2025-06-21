import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/ui/dashboard_screen/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      builder: (context, model, child) => Scaffold(
        body: model.getViewForIndex(model.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          key: model.glbKey,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          elevation: 0,
          iconSize: 30,
          selectedItemColor: AppColors.primary,
          selectedLabelStyle: tinyTextStyle.copyWith(height: 3),
          unselectedItemColor: AppColors.textColor.withOpacity(0.8),
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Iconsax.home_2_copy,
                color: AppColors.textColor.withOpacity(0.8),
              ),
              activeIcon: const Icon(
                Iconsax.home_2_copy,
                color: AppColors.primary,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Iconsax.receipt_1_copy,
                color: AppColors.textColor.withOpacity(0.8),
              ),
              activeIcon: const Icon(
                Iconsax.receipt_1_copy,
                color: AppColors.primary,
              ),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Icon(
                    Iconsax.messages_copy,
                    color: AppColors.textColor.withOpacity(0.8),
                  ),
                  Positioned(
                    top: 0,
                    left: 20,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: AppColors.errorColor,
                    ),
                  )
                ],
              ),
              activeIcon: const Icon(
                Iconsax.messages_copy,
                color: AppColors.primary,
              ),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Iconsax.happyemoji_copy,
                color: AppColors.textColor.withOpacity(0.8),
              ),
              activeIcon: const Icon(
                Iconsax.happyemoji_copy,
                color: AppColors.primary,
              ),
              label: 'User',
            ),
          ],
        ),
      ),
    );
  }
}
