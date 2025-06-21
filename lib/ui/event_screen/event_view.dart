// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_header.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/ui/event_screen/event_viewmodel.dart';

class EventView extends StatefulWidget {
  const EventView({super.key});

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventViewModel>.reactive(
      viewModelBuilder: () => EventViewModel(),
      onViewModelReady: (viewModel) {},
      builder: (context, model, child) => Scaffold(
        appBar: AppHeader(title: 'Gym'),
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gapSmall,
                  Text(
                    "Choose Your \nPlan to Begin 💪",
                    style: subHeaderTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  gapTiny,
                  Text.rich(
                    TextSpan(
                      text: "for you, ",
                      style: bodyTextStyle.copyWith(
                        color: AppColors.primary,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: "your family",
                          style: bodyTextStyle.copyWith(
                            color: AppColors.errorColor,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: " or ",
                          style: bodyTextStyle.copyWith(
                            color: AppColors.grayColor,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: "your team",
                          style: bodyTextStyle.copyWith(
                            color: AppColors.successColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  gapMedium,
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primary),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Bill Monthly",
                            style: bodyTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.white),
                          ),
                        ),
                      ),
                      horizontalSpaceMedium,
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Bill Annually (20% Off)",
                            style: bodyTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.grayColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  gapMedium,
                  SizedBox(
                    height: 510,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        planCard(
                          context,
                          color: Colors.deepPurple,
                          icon: Icons.local_cafe,
                          title: "Personal Plan",
                          price: "₦10,000",
                          subtitle: "Encourage trial & simplicity!",
                          benefits: [
                            "Access to gym equipment",
                            "1 fitness assessment/month",
                            "Locker access",
                            "Nutrition consultation",
                            "1 guest pass/month",
                          ],
                          buttonText: "Select Plan",
                        ),
                        const SizedBox(width: 16),
                        planCard(
                          context,
                          color: Colors.pink,
                          icon: Icons.cake,
                          title: "Family Plan",
                          price: "₦19,999",
                          subtitle: "More value, more commitment",
                          benefits: [
                            "Everything in Basic Plan",
                            "4 PT sessions/month",
                            "Unlimited group classes",
                            "Custom diet/workout plans",
                            "Priority locker access",
                          ],
                          buttonText: "Select Plan",
                        ),
                        const SizedBox(width: 16),
                        planCard(
                          context,
                          color: Colors.grey.shade500,
                          icon: Iconsax.briefcase,
                          title: "Company Plan",
                          price: "Let’s Talk",
                          subtitle: "Exclusive, consultative tone",
                          benefits: [
                            "Everything in Standard Plan",
                            "Unlimited personal training",
                            "Recovery & massage therapy",
                            "Private locker lounge",
                            "Branded gym apparel",
                          ],
                          buttonText: "Send us a message",
                          isLight: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget planCard(
    BuildContext context, {
    required Color color,
    required IconData icon,
    required String title,
    required String price,
    required String subtitle,
    required List<String> benefits,
    required String buttonText,
    bool isLight = false,
  }) {
    return Container(
      width: 290,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.white.withOpacity(0.3),
            child: Icon(icon, color: AppColors.white),
          ),
          gapSmall,
          gapTiny,
          Text(
            title,
            style: subHeaderTextStyle.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          gapSmall,
          gapTiny,
          Text.rich(
            TextSpan(
              text: price,
              style: headerTextStyle.copyWith(
                color: AppColors.white,
              ),
              children: [
                TextSpan(
                  text: (price != "Let’s Talk" ? "/month" : ""),
                  style: bodyTextStyle.copyWith(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Text(
            subtitle,
            style: bodyTextStyle.copyWith(color: AppColors.white, fontSize: 16),
          ),
          gapSmall,
          const Divider(
            color: AppColors.white,
          ),
          gapSmall,
          gapTiny,
          ...benefits.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  const Icon(Icons.check_circle,
                      color: AppColors.white, size: 20),
                  horizontalSpaceSmall,
                  Expanded(
                    child: Text(
                      item,
                      style: bodyTextStyle.copyWith(
                          color: AppColors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          PrimaryBtn(
            title: buttonText,
            onPress: () {},
            color: AppColors.grayColor.withOpacity(0.4),
            borderColor: AppColors.grayColor.withOpacity(0.3),
          )
        ],
      ),
    );
  }
}
