import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_header.dart';
import 'package:wishden/app/shared/app_input_text.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/helpers/utils/form_validator.dart';
import 'package:wishden/ui/feedback_screen/feedback_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FeedBackScreenView extends StatefulWidget {
  const FeedBackScreenView({super.key});

  @override
  State<FeedBackScreenView> createState() => _FeedBackScreenViewState();
}

class _FeedBackScreenViewState extends State<FeedBackScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedBackScreenViewModel>.reactive(
      viewModelBuilder: () => FeedBackScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppHeader(
            title: AppStrings.feedbacks,
          ),
          body: SafeArea(
            child: Form(
              key: model.formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapMedium,
                    Text(
                      "Send feedback",
                      style: subHeaderTextStyle.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    gapMedium,
                    Expanded(
                      child: ListView(
                        children: [
                          const Text("Subject", style: bodyTextStyle),
                          gapTiny,
                          CustomInputText(
                            controller: model.subjectController,
                            inputType: TextInputType.name,
                            hint: AppStrings.textHere,
                            validate: FormValidation.stringValidation,
                          ),
                          gapMedium,
                          const Text("Message", style: bodyTextStyle),
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
                              title: AppStrings.continueTxt,
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
