// ignore_for_file: deprecated_member_use

import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_header.dart';
import 'package:wishden/app/styels/dashline_divider.dart';
import 'package:wishden/app/styels/ui_helper.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_images.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/ui/reservation_detail_screen/reservation_detailed_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ReservationDetailedView extends StatefulWidget {
  const ReservationDetailedView({super.key});

  @override
  State<ReservationDetailedView> createState() =>
      _ReservationDetailedViewState();
}

class _ReservationDetailedViewState extends State<ReservationDetailedView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReservationDetailedViewModel>.reactive(
        viewModelBuilder: () => ReservationDetailedViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppHeader(
              title: 'Booking Detail',
              action: null,
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: SafeArea(
                child: ListView(
                  children: [
                    gapMedium,
                    Text(
                      "Room",
                      style: subHeaderTextStyle.copyWith(
                        fontWeight: FontWeight.w200,
                        color: AppColors.grayColor,
                      ),
                    ),
                    gapMedium,
                    Row(
                      children: [
                        Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.primary,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              AppImages.duluxe,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              cacheWidth: 300,
                              cacheHeight: 200,
                            ),
                          ),
                        ),
                        horizontalSpaceTiny,
                        SizedBox(
                          width: screenWidth(context, 1.5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Standard Suit Double II",
                                    style: subHeaderTextStyle.copyWith(
                                      fontSize: 16,
                                      color: AppColors.deepBlack,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Iconsax.star_1,
                                        color: AppColors.warningColor,
                                        size: 16,
                                      ),
                                      horizontalSpaceTiny,
                                      Text("5.0",
                                          style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor,
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Iconsax.location_copy,
                                        color: AppColors.grayColor,
                                        size: 16,
                                      ),
                                      horizontalSpaceTiny,
                                      Text("Gboko, Benua",
                                          style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor,
                                          ))
                                    ],
                                  ),
                                  Text("15 review",
                                      style: bodyTextStyle.copyWith(
                                        decoration: TextDecoration.underline,
                                        color: AppColors.primary,
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    gapMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Iconsax.home_copy,
                              size: 20,
                              color: AppColors.primary,
                            ),
                            horizontalSpaceTiny,
                            Text(
                              "Room No: 12",
                              style: subHeaderTextStyle.copyWith(
                                fontSize: 14,
                                color: AppColors.deepBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Iconsax.user_copy,
                              size: 20,
                              color: AppColors.primary,
                            ),
                            horizontalSpaceTiny,
                            Text(
                              "Adult: 2",
                              style: subHeaderTextStyle.copyWith(
                                fontSize: 14,
                                color: AppColors.deepBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Iconsax.user_copy,
                              size: 20,
                              color: AppColors.primary,
                            ),
                            horizontalSpaceTiny,
                            Text(
                              "Children: 0",
                              style: subHeaderTextStyle.copyWith(
                                fontSize: 14,
                                color: AppColors.deepBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    gapMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Check In:",
                          style: subHeaderTextStyle.copyWith(
                            fontWeight: FontWeight.w200,
                            color: AppColors.grayColor,
                          ),
                        ),
                        Text(
                          "11th, October, 2024.",
                          style: subHeaderTextStyle.copyWith(
                            fontSize: 16,
                            color: AppColors.deepBlack,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    gapMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Check Out:",
                          style: subHeaderTextStyle.copyWith(
                            fontWeight: FontWeight.w200,
                            color: AppColors.grayColor,
                          ),
                        ),
                        Text(
                          "13th, October, 2024.",
                          style: subHeaderTextStyle.copyWith(
                            fontSize: 16,
                            color: AppColors.deepBlack,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    gapMedium,
                    const DashedLineDivider(),
                    gapMedium,
                    Text(
                      "Wed 11th, 2025",
                      style: bodyTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    gapMedium,
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: AppColors.grayColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: screenWidth(context, 1.2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Payment for room",
                                        style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor),
                                      ),
                                      Text(
                                        "₦26,000",
                                        style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor),
                                      ),
                                    ],
                                  ),
                                ),
                                gapTiny,
                                SizedBox(
                                  width: screenWidth(context, 1.2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Bottle of Chandon Champagne",
                                        style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor),
                                      ),
                                      Text(
                                        "₦6,000",
                                        style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor),
                                      ),
                                    ],
                                  ),
                                ),
                                gapTiny,
                                SizedBox(
                                  width: screenWidth(context, 1.2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Grilled Chicken Caesar Salad",
                                        style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor),
                                      ),
                                      Text(
                                        "₦11,000",
                                        style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    gapMedium,
                    Text(
                      "Thus 12th, 2025",
                      style: bodyTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    gapMedium,
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: AppColors.grayColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: screenWidth(context, 1.2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Payment for room",
                                        style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor),
                                      ),
                                      Text(
                                        "₦26,000",
                                        style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor),
                                      ),
                                    ],
                                  ),
                                ),
                                gapTiny,
                                SizedBox(
                                  width: screenWidth(context, 1.2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Bottle of Chandon Champagne",
                                        style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor),
                                      ),
                                      Text(
                                        "₦6,000",
                                        style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor),
                                      ),
                                    ],
                                  ),
                                ),
                                gapTiny,
                                SizedBox(
                                  width: screenWidth(context, 1.2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Grilled Chicken Caesar Salad",
                                        style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor),
                                      ),
                                      Text(
                                        "₦11,000",
                                        style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    gapMedium,
                    Text(
                      "Fri 13th, 2025",
                      style: bodyTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    gapMedium,
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: AppColors.grayColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: screenWidth(context, 1.2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Payment for room ",
                                        style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor),
                                      ),
                                      Text(
                                        "₦2,000",
                                        style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor),
                                      ),
                                    ],
                                  ),
                                ),
                                gapTiny,
                                SizedBox(
                                  width: screenWidth(context, 1.2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Mojito Cocktail",
                                        style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor),
                                      ),
                                      Text(
                                        "₦11,000",
                                        style: bodyTextStyle.copyWith(
                                            color: AppColors.grayColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    gapMedium,
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.successColor.withOpacity(0.2)
                              // .withOpacity(0.3),
                              ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15,
                              top: 5,
                              bottom: 5,
                            ),
                            child: Text(
                              "Bar",
                              style: bodyTextStyle.copyWith(
                                  color: AppColors.successColor),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.successColor.withOpacity(0.2)
                              // .withOpacity(0.3),
                              ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15,
                              top: 5,
                              bottom: 5,
                            ),
                            child: Text(
                              "Kitchen Service",
                              style: bodyTextStyle.copyWith(
                                  color: AppColors.successColor),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.successColor.withOpacity(0.2)
                              // .withOpacity(0.3),
                              ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15,
                              top: 5,
                              bottom: 5,
                            ),
                            child: Text(
                              "Room Service",
                              style: bodyTextStyle.copyWith(
                                  color: AppColors.successColor),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.successColor.withOpacity(0.2)
                              // .withOpacity(0.3),
                              ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15,
                              top: 5,
                              bottom: 5,
                            ),
                            child: Text(
                              "Laundary Service",
                              style: bodyTextStyle.copyWith(
                                  color: AppColors.successColor),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.successColor.withOpacity(0.2)
                              // .withOpacity(0.3),
                              ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15,
                              top: 5,
                              bottom: 5,
                            ),
                            child: Text(
                              "Gym",
                              style: bodyTextStyle.copyWith(
                                  color: AppColors.successColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    gapMassive,
                    gapMassive,
                  ],
                ),
              ),
            ),
            floatingActionButton: Container(
              height: 150,
              width: screenWidth(context, 1.08),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.primaryDark),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Total Payment",
                          style: bodyTextStyle.copyWith(
                              fontSize: 16, color: AppColors.white),
                        ),
                      ],
                    ),
                    const DashedLineDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total:",
                              style: bodyTextStyle.copyWith(
                                  fontSize: 16, color: AppColors.white),
                            ),
                            Text(
                              "₦340,000",
                              style: subHeaderTextStyle.copyWith(
                                  color: AppColors.white),
                            ),
                          ],
                        ),
                        PrimaryBtn(
                          title: "Download",
                          onPress: () {},
                          width: screenWidth(context, 2.5),
                          icon: Iconsax.document_download_copy,
                          iconColor: AppColors.deepBlack,
                          isIcon: true,
                          color: AppColors.white,
                          textColor: AppColors.deepBlack,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
