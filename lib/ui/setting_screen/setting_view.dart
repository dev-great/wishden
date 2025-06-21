import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/custom_list_tile.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_images.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/navigation/route.dart';
import 'package:wishden/ui/setting_screen/setting_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingViewModel>.reactive(
      viewModelBuilder: () => SettingViewModel(),
      onViewModelReady: (viewModel) {},
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: SafeArea(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.profile,
                      style: subHeaderTextStyle.copyWith(
                        fontWeight: FontWeight.w200,
                        color: AppColors.grayColor,
                      ),
                    ),
                  ],
                ),
                gapMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(AppImages.logo,
                                  fit: BoxFit.cover)),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white,
                            ),
                            child: SizedBox(
                              height: 35,
                              width: 35,
                              child: IconButton(
                                icon: const Icon(Icons.edit,
                                    size: 16, color: AppColors.primary),
                                // onPressed: _pickImage,
                                onPressed: () async {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                gapMedium,
                CustomListTile(
                  title: AppStrings.editProfile,
                  leading: Iconsax.user_octagon_copy,
                  ontap: () {
                    locator<GoRouter>().push(
                      AppRoutes.editProfileView,
                    );
                  },
                  trailing: const Icon(Iconsax.arrow_right_3_copy),
                ),
                gapMedium,
                CustomListTile(
                  title: AppStrings.changePassword,
                  leading: Iconsax.lock_1_copy,
                  ontap: () {
                    locator<GoRouter>().push(
                      AppRoutes.changePasswordView,
                    );
                  },
                  trailing: const Icon(Iconsax.arrow_right_3_copy),
                ),
                gapMedium,
                CustomListTile(
                  title: AppStrings.notification,
                  leading: Iconsax.notification_1_copy,
                  trailing: Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: model.switchValue,
                      onChanged: (value) {
                        model.toggleSettings(value);
                      },
                    ),
                  ),
                  ontap: () {},
                ),
                gapMedium,
                CustomListTile(
                  title: AppStrings.deleteAccount,
                  leading: Iconsax.trash_copy,
                  ontap: () {
                    locator<GoRouter>().push(
                      AppRoutes.delete1View,
                    );
                  },
                  trailing: const Icon(Iconsax.arrow_right_3_copy),
                ),
                gapMedium,
                CustomListTile(
                  title: AppStrings.feedbacks,
                  leading: Iconsax.note_copy,
                  ontap: () {
                    locator<GoRouter>().push(
                      AppRoutes.feedBackScreenView,
                    );
                  },
                  trailing: const Icon(Iconsax.arrow_right_3_copy),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
