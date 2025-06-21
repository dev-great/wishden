import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_header.dart';
import 'package:wishden/app/styels/ui_helper.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/ui/event_detail_screen/event_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EventDetailScreenView extends StatefulWidget {
  const EventDetailScreenView({super.key});

  @override
  State<EventDetailScreenView> createState() => _EventDetailScreenViewState();
}

class _EventDetailScreenViewState extends State<EventDetailScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventDetailScreenViewModel>.reactive(
        viewModelBuilder: () => EventDetailScreenViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: AppHeader(title: 'View event'),
              body: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                child: SafeArea(
                  child: ListView(
                    children: [
                      gapMedium,
                      Text(
                        "Event",
                        style: subHeaderTextStyle.copyWith(
                          fontWeight: FontWeight.w200,
                          color: AppColors.grayColor,
                        ),
                      ),
                      gapMedium,
                      const Text("Night in Brown", style: bodyTextStyle),
                      gapMedium,
                      Text(
                        "Club",
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
                              color: AppColors.errorColor,
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
                                      "Skyline Nights",
                                      style: subHeaderTextStyle.copyWith(
                                        fontSize: 16,
                                        color: AppColors.deepBlack,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Iconsax.star_1,
                                          color: AppColors.grayColor,
                                          size: 16,
                                        ),
                                        horizontalSpaceTiny,
                                        Text("4.5",
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Iconsax.location_copy,
                                          color: AppColors.grayColor,
                                          size: 16,
                                        ),
                                        horizontalSpaceTiny,
                                        Text("Hubbard St, Chicago",
                                            style: bodyTextStyle.copyWith(
                                              color: AppColors.grayColor,
                                            ))
                                      ],
                                    ),
                                    Text("\$\$\$",
                                        style: bodyTextStyle.copyWith(
                                          color: AppColors.grayColor,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      gapMedium,
                      Text(
                        "Date",
                        style: subHeaderTextStyle.copyWith(
                          fontWeight: FontWeight.w200,
                          color: AppColors.grayColor,
                        ),
                      ),
                      gapMedium,
                      const Text("16th, October, 2024.", style: bodyTextStyle),
                      gapMedium,
                      Text(
                        "Time",
                        style: subHeaderTextStyle.copyWith(
                          fontWeight: FontWeight.w200,
                          color: AppColors.grayColor,
                        ),
                      ),
                      gapMedium,
                      const Text("8:00 pm", style: bodyTextStyle),
                      gapMedium,
                      Text(
                        "Description",
                        style: subHeaderTextStyle.copyWith(
                          fontWeight: FontWeight.w200,
                          color: AppColors.grayColor,
                        ),
                      ),
                      gapMedium,
                      const Text(
                          " Get ready to be transported to a tropical paradise, It’s time to embrace the island vibes with our Tropical Paradise Party!",
                          style: bodyTextStyle),
                      gapMedium,
                      PrimaryBtn(title: "Reserve table", onPress: () {}),
                      gapMedium,
                    ],
                  ),
                ),
              ));
        });
  }
}
