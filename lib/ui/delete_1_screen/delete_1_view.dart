import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_header.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/navigation/route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wishden/ui/delete_1_screen/delete_1_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Delete1ScreenView extends StatefulWidget {
  const Delete1ScreenView({super.key});

  @override
  State<Delete1ScreenView> createState() => _Delete1ScreenViewState();
}

class _Delete1ScreenViewState extends State<Delete1ScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Delete1ScreenViewModel>.reactive(
        viewModelBuilder: () => Delete1ScreenViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: AppHeader(title: AppStrings.deleteAccount),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      gapMedium,
                      Text("Are you sure you want to delete your account? ",
                          style: subHeaderTextStyle.copyWith(
                              fontWeight: FontWeight.w200)),
                      gapTiny,
                      gapMedium,
                      Expanded(
                        child: ListView(
                          children: [
                            const Text(
                              "This action will permanently remove: ",
                              style: bodyTextStyle,
                            ),
                            gapMedium,
                            const Text(
                              " . Your profile ",
                              style: bodyTextStyle,
                            ),
                            const Text(
                              " . Your reservations",
                              style: bodyTextStyle,
                            ),
                            gapMedium,
                            Text(
                              "This process cannot be undone",
                              style: bodyTextStyle.copyWith(
                                  fontWeight: FontWeight.w700),
                            ),
                            gapMedium,
                            PrimaryBtn(
                                title: "Delete",
                                isLoading: model.isBusy,
                                onPress: () async {
                                  locator<GoRouter>().push(
                                    AppRoutes.delete2View,
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
