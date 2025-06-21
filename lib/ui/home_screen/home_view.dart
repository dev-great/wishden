// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_input_text.dart';
import 'package:wishden/app/styels/ui_helper.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_images.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/navigation/route.dart';
import 'package:stacked/stacked.dart';
import 'package:wishden/ui/home_screen/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) {},
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: screenWidth(context, 1),
                  decoration: BoxDecoration(
                      color: AppColors.primaryDark,
                      borderRadius: BorderRadius.circular(30)
                      //   bottomLeft: Radius.circular(20),
                      //   bottomRight: Radius.circular(20),
                      // ),
                      ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 20,
                      bottom: 30,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: screenWidth(context, 1),
                          height: 60,
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 26,
                                    backgroundColor: AppColors.primary,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.white,
                                      child: Icon(
                                        Iconsax.camera_copy,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                  horizontalSpaceSmall,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hi Greatness 👋",
                                        style: subHeaderTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Text(
                                        "Welcome to Wishden",
                                        style: bodyTextStyle.copyWith(
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              CircleAvatar(
                                radius: 23,
                                backgroundColor:
                                    AppColors.white.withOpacity(0.1),
                                child: const Icon(
                                  Iconsax.notification_copy,
                                  size: 23,
                                  color: AppColors.white,
                                ),
                              ),
                              horizontalSpaceSmall,
                              CircleAvatar(
                                radius: 23,
                                backgroundColor:
                                    AppColors.white.withOpacity(0.1),
                                child: const Icon(
                                  Iconsax.bookmark_2_copy,
                                  size: 23,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        gapMedium,
                        gapSmall,
                        const CustomInputText(
                            suffix: Icon(Iconsax.search_normal_1_copy),
                            inputType: TextInputType.text,
                            hint: "Search rooms, events, booking..."),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Column(children: [
                  gapSmall,
                  const Row(
                    children: [
                      Text(
                        "Hot 🔥",
                        style: subHeaderTextStyle,
                      ),
                    ],
                  ),
                  gapSmall,
                  gapSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          locator<GoRouter>().push(AppRoutes.eventView);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                  color: AppColors.warningColorDark
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(AppImages.gym),
                                ),
                              ),
                            ),
                            const Text(
                              "Gym",
                              style: bodyTextStyle,
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          locator<GoRouter>()
                              .push(AppRoutes.menuView, extra: true);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                  color: AppColors.blueColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(AppImages.kitchen),
                                ),
                              ),
                            ),
                            const Text(
                              "kitchen",
                              style: bodyTextStyle,
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          locator<GoRouter>()
                              .push(AppRoutes.menuView, extra: false);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                  color: AppColors.warningColorDark
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(AppImages.bar),
                                ),
                              ),
                            ),
                            const Text(
                              "Bar",
                              style: bodyTextStyle,
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                                color: AppColors.errorColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(AppImages.hall),
                              ),
                            ),
                          ),
                          const Text(
                            "Event Hall",
                            style: bodyTextStyle,
                          )
                        ],
                      ),
                    ],
                  ),
                  gapMedium,
                  const Row(
                    children: [
                      Text(
                        "Explore Rooms",
                        style: subHeaderTextStyle,
                      ),
                    ],
                  ),
                  gapSmall,
                  gapSmall,
                  GridView.builder(
                    itemCount: 7,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 items per row
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 30,
                      childAspectRatio:
                          0.65, // Adjust as needed for layout balance
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          locator<GoRouter>().push(AppRoutes.homeDetailedView);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.white.withOpacity(0.4),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      model.roomImages[index],
                                      width: double.infinity,
                                      height: 150,
                                      fit: BoxFit.cover,
                                      cacheWidth: 300,
                                      cacheHeight: 200,
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor:
                                          AppColors.grayColor.withOpacity(0.8),
                                      child: const Icon(
                                        Iconsax.heart,
                                        color: AppColors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                model.roomTitle[index],
                                style: bodyTextStyle.copyWith(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 6),
                              const Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Iconsax.star_1,
                                        color: AppColors.warningColorDark,
                                        size: 16,
                                      ),
                                      Icon(
                                        Iconsax.star_1,
                                        color: AppColors.warningColorDark,
                                        size: 16,
                                      ),
                                      Icon(
                                        Iconsax.star_1,
                                        color: AppColors.warningColorDark,
                                        size: 16,
                                      ),
                                      Icon(
                                        Iconsax.star_1,
                                        color: AppColors.warningColorDark,
                                        size: 16,
                                      ),
                                      Icon(
                                        Iconsax.star_1,
                                        color: AppColors.warningColorDark,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  horizontalSpaceTiny,
                                  Text("5.0", style: bodyTextStyle),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Text(
                                    model.roomPrice[index],
                                    style: bodyTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    " / Night",
                                    style: bodyTextStyle.copyWith(
                                      color: AppColors.primaryDark,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  gapLarge,
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
