import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_expandable_description.dart';
import 'package:wishden/app/styels/ui_helper.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_images.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/navigation/route.dart';
import 'package:wishden/ui/home_detailed_screen/home_detailed_viewmodel.dart';
import 'package:wishden/ui/widgets/full_screen_images.dart';

class HomeDetailedView extends StatefulWidget {
  const HomeDetailedView({super.key});

  @override
  State<HomeDetailedView> createState() => _HomeDetailedViewState();
}

class _HomeDetailedViewState extends State<HomeDetailedView> {
  final List<String> imageUrls = [
    AppImages.standardS,
    AppImages.standardD1,
    AppImages.standardD2,
    AppImages.studio,
    AppImages.duluxe,
    AppImages.executive,
  ];
  int _currentIndex = 0;

  void openFullScreenGallery(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FullScreenImageGallery(
          imageUrls: imageUrls,
          initialIndex: index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeDetailedViewModel>.reactive(
      viewModelBuilder: () => HomeDetailedViewModel(),
      onViewModelReady: (viewModel) {},
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        floatingActionButton: PrimaryBtn(
            title: "Book Now",
            onPress: () {
              locator<GoRouter>().push(AppRoutes.reservationRoomView);
            }),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 350,
                        child: PageView.builder(
                          itemCount: imageUrls.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () => openFullScreenGallery(index),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.asset(
                                    imageUrls[index],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    cacheWidth: 300,
                                    cacheHeight: 200,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 20,
                        child: GestureDetector(
                          onTap: () {
                            locator<GoRouter>().pop();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                              Iconsax.arrow_left_copy,
                              color: AppColors.deepBlack,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: 20,
                        child: GestureDetector(
                          onTap: () {
                            locator<GoRouter>().pop();
                          },
                          child: const CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColors.white,
                            child: Icon(
                              Iconsax.heart,
                              size: 23,
                              color: AppColors.errorColor,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        left: screenWidth(context, 2.8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            imageUrls.length,
                            (index) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                width: _currentIndex == index ? 30 : 8,
                                height: 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: _currentIndex == index
                                        ? AppColors.primary
                                        : AppColors.grayColor),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Standard Suit Double II",
                          style: subHeaderTextStyle,
                        ),
                        gapMedium,
                        const Row(
                          children: [
                            Icon(Iconsax.location_copy),
                            horizontalSpaceTiny,
                            Text(
                              "Gboko, Benue.",
                              style: bodyTextStyle,
                            )
                          ],
                        ),
                        gapTiny,
                        gapTiny,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(Iconsax.star_copy),
                                horizontalSpaceTiny,
                                Text(
                                  "5.0 (11 reviews)",
                                  style: bodyTextStyle,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("₦15,000",
                                    style: subHeaderTextStyle.copyWith(
                                      color: AppColors.deepBlack,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(" / Night",
                                    style: bodyTextStyle.copyWith(
                                      color: AppColors.primary,
                                    )),
                              ],
                            )
                          ],
                        ),
                        gapMedium,
                        const Text(
                          "Description",
                          style: subHeaderTextStyle,
                        ),
                        gapMedium,
                        const ExpandableDescription(
                          text:
                              "This luxurious hotel is located in the heart of Abuja with modern amenities, breathtaking views, and 24/7 concierge service. Our rooms are equipped with smart features, and guests enjoy free breakfast, rooftop access, gym services, and much more. Ideal for business trips or vacations in comfort.",
                        ),
                        gapMedium,
                        const Text(
                          "What we offer",
                          style: subHeaderTextStyle,
                        ),
                        gapMedium,
                        SizedBox(
                          height: 350,
                          child: GridView.builder(
                            padding: const EdgeInsets.all(12),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: model.amenities.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // 4 columns
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 1,
                            ),
                            itemBuilder: (context, index) {
                              final amenity = model.amenities[index];
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(amenity.icon,
                                        size: 28, color: AppColors.primary),
                                    const SizedBox(height: 6),
                                    Text(
                                      amenity.label,
                                      textAlign: TextAlign.center,
                                      style: tinyTextStyle,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        gapMassive,
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
