import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/helpers/constant/app_colors.dart';

// ignore: must_be_immutable
class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  bool? isAction;
  Widget? action;
  AppHeader({
    super.key,
    required this.title,
    this.action,
    this.isAction,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: AppColors.backgroundColor,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            locator<GoRouter>().pop();
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.grayColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Iconsax.arrow_left_copy,
              size: 20,
            ),
          ),
        ),
      ),
      title: Text(
        title ?? "",
        style: subHeaderTextStyle.copyWith(fontWeight: FontWeight.w200),
      ),
      actions: [
        if (isAction == true) ...[action!]
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
