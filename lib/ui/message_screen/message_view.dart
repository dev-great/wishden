import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/styels/ui_helper.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/navigation/route.dart';
import 'package:wishden/ui/message_screen/message_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessageViewModel>.reactive(
      viewModelBuilder: () => MessageViewModel(),
      onViewModelReady: (viewModel) {},
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
                      AppStrings.messages,
                      style: subHeaderTextStyle.copyWith(
                        fontWeight: FontWeight.w200,
                        color: AppColors.grayColor,
                      ),
                    ),
                  ],
                ),
                gapMedium,
                ListView.builder(
                  itemCount: model.items.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(model.items[index]),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          model.items.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('${model.items[index]} deleted')),
                        );
                      },
                      background: Container(
                        decoration: BoxDecoration(
                            color: AppColors.errorColor,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.centerRight,
                        child: const Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(Iconsax.trash_copy,
                              size: 30, color: Colors.white),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: GestureDetector(
                          onTap: () {
                            locator<GoRouter>().push(
                              AppRoutes.messageChatScreenView,
                            );
                          },
                          child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              tileColor: AppColors.white,
                              leading: const CircleAvatar(
                                radius: 20,
                              ),
                              title: Text(
                                "Marquee",
                                style: bodyTextStyle.copyWith(
                                  color: AppColors.deepBlack,
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  const Icon(
                                    Icons.check,
                                    size: 20,
                                    color: AppColors.successColor,
                                  ),
                                  SizedBox(
                                    width: screenWidth(context, 2.5),
                                    child: const Text(
                                      "Please which of the tables are available",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: tinyTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: index == 1 || index == 2
                                  ? const Text(
                                      "12:22 PM",
                                      style: tinyTextStyle,
                                    )
                                  : CircleAvatar(
                                      radius: 10,
                                      backgroundColor: AppColors.primary,
                                      child: Center(
                                        child: Text(
                                          "11",
                                          style: tinyTextStyle.copyWith(
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    )),
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
