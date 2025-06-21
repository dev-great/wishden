import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_header.dart';
import 'package:wishden/app/shared/app_input_text.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_images.dart';
import 'package:wishden/helpers/constant/app_local_storage.dart';
import 'package:wishden/helpers/constant/app_lottie.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/helpers/utils/form_validator.dart';
import 'package:wishden/navigation/route.dart';
import 'package:wishden/services/local_storage_service.dart';
import 'package:wishden/ui/review_screen/review_viewmodel.dart';
import 'package:wishden/ui/splash_screen/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';
import 'package:lottie/lottie.dart';

class ReviewScreenView extends StatefulWidget {
  const ReviewScreenView({super.key});

  @override
  State<ReviewScreenView> createState() => _ReviewScreenViewState();
}

class _ReviewScreenViewState extends State<ReviewScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReviewScreenViewModel>.reactive(
      viewModelBuilder: () => ReviewScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppHeader(
            title: "Rating & Review",
          ),
          body: SafeArea(
            child: Form(
              key: model.formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapMedium,
                    Expanded(
                      child: ListView(
                        children: [
                          gapMedium,
                          const Text("Rating", style: bodyTextStyle),
                          gapTiny,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.star,
                                size: 60,
                              ),
                              Icon(
                                Icons.star,
                                size: 60,
                              ),
                              Icon(
                                Icons.star,
                                size: 60,
                              ),
                              Icon(
                                Icons.star,
                                size: 60,
                              ),
                              Icon(
                                Icons.star,
                                size: 60,
                              ),
                            ],
                          ),
                          gapMedium,
                          const Text("Subject", style: bodyTextStyle),
                          gapTiny,
                          CustomInputText(
                            controller: model.subjectController,
                            inputType: TextInputType.name,
                            hint: AppStrings.textHere,
                            validate: FormValidation.stringValidation,
                          ),
                          gapMedium,
                          const Text("Details", style: bodyTextStyle),
                          gapTiny,
                          CustomInputText(
                            controller: model.messageController,
                            inputType: TextInputType.name,
                            hint: AppStrings.textHere,
                            max: 5,
                            validate: FormValidation.stringValidation,
                          ),
                          gapMedium,
                          PrimaryBtn(
                              title: "Submit",
                              isLoading: model.isBusy,
                              onPress: () async {}),
                          gapLarge,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
