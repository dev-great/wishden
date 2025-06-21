import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_date_selector.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_dropdown.dart';
import 'package:wishden/app/shared/app_header.dart';
import 'package:wishden/app/shared/app_input_text.dart';
import 'package:wishden/app/styels/dashline_divider.dart';
import 'package:wishden/app/styels/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_images.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/helpers/utils/form_validator.dart';
import 'package:wishden/ui/reserve_room_screen/reservation_room_viewmodel.dart';

class ReservationRoomView extends StatefulWidget {
  const ReservationRoomView({super.key});

  @override
  State<ReservationRoomView> createState() => _ReservationRoomViewState();
}

class _ReservationRoomViewState extends State<ReservationRoomView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReservationRoomViewModel>.reactive(
        viewModelBuilder: () => ReservationRoomViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppHeader(title: "Confirm & Pay"),
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
                          "Confirm & Pay",
                          style: bodyTextStyle.copyWith(
                              fontSize: 16, color: AppColors.white),
                        ),
                      ],
                    ),
                    DashedLineDivider(),
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
                              "₦15,000",
                              style: subHeaderTextStyle.copyWith(
                                  color: AppColors.white),
                            ),
                          ],
                        ),
                        PrimaryBtn(
                          title: "Pay",
                          onPress: () {},
                          width: screenWidth(context, 2.5),
                          icon: Iconsax.arrow_right_1_copy,
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SafeArea(
                    child: Column(
                  children: [
                    gapMedium,
                    Container(
                      height: 120,
                      width: screenWidth(context, 1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromARGB(255, 138, 136, 254)
                              .withOpacity(0.1)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 90,
                              width: 90,
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
                            horizontalSpaceSmall,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Standard Suit Double II",
                                  style:
                                      subHeaderTextStyle.copyWith(fontSize: 16),
                                ),
                                gapTiny,
                                const Row(
                                  children: [
                                    const Icon(
                                      Iconsax.star_1,
                                      color: AppColors.grayColor,
                                      size: 16,
                                    ),
                                    horizontalSpaceTiny,
                                    Text(
                                      "5.0 (11 reviews)",
                                      style: bodyTextStyle,
                                    )
                                  ],
                                ),
                                gapTiny,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "₦15,000",
                                      style: subHeaderTextStyle.copyWith(
                                          fontSize: 18),
                                    ),
                                    const Text(
                                      " / night",
                                      style: bodyTextStyle,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    gapMedium,
                    CustomDateRangeFormField(
                      prefixIcon: const Icon(
                        Iconsax.calendar_1_copy,
                        color: AppColors.textColor,
                        size: 18,
                      ),
                      value: model.checkInController,
                      hint: model.checkInController.text.isEmpty
                          ? 'Check In Date'
                          : DateFormat('yyyy-MM-dd')
                              .format(model.dateOfDate ?? DateTime.now()),
                      onDateSelected: () => model.selectCheckInDate(
                        context,
                        DateTime(1980),
                        DateTime(2005),
                        DateTime(2000),
                      ),
                    ),
                    gapMedium,
                    CustomDateRangeFormField(
                      prefixIcon: const Icon(
                        Iconsax.calendar_1_copy,
                        color: AppColors.textColor,
                        size: 18,
                      ),
                      value: model.checkOutController,
                      hint: model.checkOutController.text.isEmpty
                          ? 'Check Out Date'
                          : DateFormat('yyyy-MM-dd')
                              .format(model.dateOfDate ?? DateTime.now()),
                      onDateSelected: () => model.selectCheckOutDate(
                        context,
                        DateTime(1980),
                        DateTime(2005),
                        DateTime(2000),
                      ),
                    ),
                    gapMedium,
                    buildDropdown("Number of Rooms", model.selectedRooms,
                        "Room(s)", model.numberOptions, (val) {
                      setState(() => model.selectedRooms = val);
                    }),
                    gapMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: screenWidth(context, 2.4),
                          child: buildDropdown(
                              "No. of Adults",
                              model.selectedAdults,
                              "Adult(s)",
                              model.numberOptions, (val) {
                            setState(() => model.selectedAdults = val);
                          }),
                        ),
                        SizedBox(
                          width: screenWidth(context, 2.4),
                          child: buildDropdown(
                              "No. of Children",
                              model.selectedChildren,
                              "Children(s)",
                              model.childrenOptions, (val) {
                            setState(() => model.selectedChildren = val);
                          }),
                        ),
                      ],
                    ),
                    gapMedium,
                    CustomInputText(
                      inputType: TextInputType.text,
                      hint: "Enter Full Name",
                      validate: FormValidation.stringValidation,
                      controller: model.nameController,
                      prefix: const Icon(
                        Iconsax.user_copy,
                        size: 18,
                      ),
                    ),
                    gapMedium,
                    CustomInputText(
                      inputType: TextInputType.text,
                      hint: "Enter Your Email",
                      validate: FormValidation.stringValidation,
                      controller: model.emailController,
                      prefix: const Icon(
                        Iconsax.sms_copy,
                        size: 18,
                      ),
                    ),
                    gapMedium,
                    CustomInputText(
                      inputType: TextInputType.text,
                      hint: "Enter Your Phone Number",
                      validate: FormValidation.stringValidation,
                      controller: model.phoneController,
                      prefix: const Icon(
                        Iconsax.call_copy,
                        size: 18,
                      ),
                    ),
                    gapMassive,
                    gapMassive,
                  ],
                )),
              ),
            ),
          );
        });
  }
}
