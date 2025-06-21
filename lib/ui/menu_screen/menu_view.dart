import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_header.dart';
import 'package:wishden/app/styels/dashline_divider.dart';
import 'package:wishden/app/styels/ui_helper.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_images.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/ui/menu_screen/menu_viewmodel.dart';

class MenuView extends StatefulWidget {
  final bool isKitchen;
  const MenuView({super.key, required this.isKitchen});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  NumberFormat currencyFormatter =
      NumberFormat.currency(locale: 'en_US', symbol: '₦');
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MenuViewModel>.reactive(
      viewModelBuilder: () => MenuViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        floatingActionButton: Container(
          padding: const EdgeInsets.all(12.0),
          width: screenWidth(context, 1.08),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.primaryDark),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: model.selectedMenuTags.map((item) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.white,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${item['name']} ×${item['quantity']}",
                            style: bodyTextStyle,
                          ),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: () {
                              model.removeItem(item['name']);
                            },
                            child: Icon(
                              Icons.close,
                              size: 16,
                              color: AppColors.errorColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                gapSmall,
                DashedLineDivider(),
                gapSmall,
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
                      title: "Check Out",
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
        appBar: AppHeader(title: widget.isKitchen == true ? "Kitchen" : "Bar"),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                TabBar(
                  controller: tabController,
                  indicatorColor: AppColors.primary,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.primary,
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 80),
                  ),
                  tabs: const [
                    Tab(
                      child: Text(
                        "Meal",
                        style: bodyTextStyle,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Drinks",
                        style: bodyTextStyle,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Others",
                        style: bodyTextStyle,
                      ),
                    ),
                  ],
                ),
                gapMedium,
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 200),
                        child: GridView.builder(
                          itemCount: model.menuItems.length,
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2 items per row
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 30,
                            childAspectRatio:
                                0.65, // Adjust as needed for layout balance
                          ),
                          itemBuilder: (context, index) {
                            final item = model.menuItems[index];
                            return GestureDetector(
                              onTap: () {
                                model.addOrUpdateItem(item['name']);
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            widget.isKitchen == true
                                                ? AppImages.food
                                                : AppImages.drink,
                                            width: double.infinity,
                                            height: 150,
                                            fit: BoxFit.contain,
                                            cacheWidth: 300,
                                            cacheHeight: 200,
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          right: 10,
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: AppColors.grayColor
                                                .withOpacity(0.8),
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
                                      "Product Name",
                                      style: bodyTextStyle.copyWith(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Text(
                                          "₦${item['originalPrice']}",
                                          style: bodyTextStyle.copyWith(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        horizontalSpaceSmall,
                                        Text(
                                          "₦${item['price']}",
                                          style: bodyTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
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
                      ),
                      GridView.builder(
                        itemCount: model.menuItems.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 items per row
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 30,
                          childAspectRatio:
                              0.65, // Adjust as needed for layout balance
                        ),
                        itemBuilder: (context, index) {
                          final item = model.menuItems[index];
                          return GestureDetector(
                            onTap: () {},
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
                                          AppImages.drink,
                                          width: double.infinity,
                                          height: 150,
                                          fit: BoxFit.contain,
                                          cacheWidth: 300,
                                          cacheHeight: 200,
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor: AppColors.grayColor
                                              .withOpacity(0.8),
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
                                    "Product Name",
                                    style: bodyTextStyle.copyWith(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Text(
                                        "₦${item['originalPrice']}",
                                        style: bodyTextStyle.copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      horizontalSpaceSmall,
                                      Text(
                                        "₦${item['price']}",
                                        style: bodyTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
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
                      GridView.builder(
                        itemCount: model.menuItems.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 items per row
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 30,
                          childAspectRatio:
                              0.65, // Adjust as needed for layout balance
                        ),
                        itemBuilder: (context, index) {
                          final item = model.menuItems[index];
                          return GestureDetector(
                            onTap: () {},
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
                                          widget.isKitchen == true
                                              ? AppImages.food
                                              : AppImages.drink,
                                          width: double.infinity,
                                          height: 150,
                                          fit: BoxFit.contain,
                                          cacheWidth: 300,
                                          cacheHeight: 300,
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor: AppColors.grayColor
                                              .withOpacity(0.8),
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
                                    "Product Name",
                                    style: bodyTextStyle.copyWith(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Text(
                                        "₦${item['originalPrice']}",
                                        style: bodyTextStyle.copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      horizontalSpaceSmall,
                                      Text(
                                        "₦${item['price']}",
                                        style: bodyTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
