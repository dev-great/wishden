import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/styels/dashline_divider.dart';
import 'package:wishden/app/styels/ui_helper.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/navigation/route.dart';
import 'package:wishden/ui/reservation_screen/reservation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ReservationView extends StatefulWidget {
  const ReservationView({super.key});

  @override
  State<ReservationView> createState() => _ReservationViewState();
}

class _ReservationViewState extends State<ReservationView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReservationViewModel>.reactive(
      viewModelBuilder: () => ReservationViewModel(),
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
                      "Bookings",
                      style: subHeaderTextStyle.copyWith(
                        fontWeight: FontWeight.w200,
                        color: AppColors.grayColor,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          locator<GoRouter>().push(
                            AppRoutes.reservationHistoryView,
                          );
                        },
                        child: const Icon(Icons.history))
                  ],
                ),
                gapMedium,
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          locator<GoRouter>().push(
                            AppRoutes.reservationDetailedView,
                          );
                        },
                        child: Container(
                          width: screenWidth(context, 1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                      ),
                                    ),
                                    horizontalSpaceSmall,
                                    Text(
                                      "₦340,000",
                                      style: subHeaderTextStyle.copyWith(
                                        fontSize: 22,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                gapSmall,
                                gapTiny,
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.primary
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
                                          "Check Out: 12 hrs 20 min",
                                          style: bodyTextStyle.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                gapSmall,
                                gapTiny,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Iconsax.home_copy,
                                          size: 18,
                                          color: AppColors.primary,
                                        ),
                                        horizontalSpaceTiny,
                                        Text(
                                          "Room No: 12",
                                          style: subHeaderTextStyle.copyWith(
                                            fontSize: 14,
                                            color: AppColors.deepBlack,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Iconsax.user_copy,
                                          size: 18,
                                          color: AppColors.primary,
                                        ),
                                        horizontalSpaceTiny,
                                        Text(
                                          "Adult: 2",
                                          style: subHeaderTextStyle.copyWith(
                                            fontSize: 14,
                                            color: AppColors.deepBlack,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Iconsax.user_copy,
                                          size: 18,
                                          color: AppColors.primary,
                                        ),
                                        horizontalSpaceTiny,
                                        Text(
                                          "Children: 0",
                                          style: subHeaderTextStyle.copyWith(
                                            fontSize: 14,
                                            color: AppColors.deepBlack,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                gapSmall,
                                gapTiny,
                                const DashedLineDivider(),
                                gapSmall,
                                gapTiny,
                                // Text(
                                //   "Items ordered:",
                                //   style: bodyTextStyle.copyWith(
                                //     fontSize: 16,
                                //     decoration: TextDecoration.underline,
                                //   ),
                                // ),
                                // gapTiny,
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            width: 2, color: AppColors.primary),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: ListView.builder(
                                        itemCount: model.orderedItems.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5),
                                            child: Text(
                                              model.orderedItems[index],
                                              style: bodyTextStyle,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
