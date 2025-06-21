import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/styels/ui_helper.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/ui/login_screen/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.white,
              appBar: AppBar(
                backgroundColor: AppColors.white,
                surfaceTintColor: AppColors.white,
                centerTitle: true,
                automaticallyImplyLeading: false,
                leading: GestureDetector(
                  onTap: () => locator<GoRouter>().pop(context),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Iconsax.arrow_left_2_copy,
                      size: 20,
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Form(
                    key: model.formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: screenHeight(context, 1.1),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
