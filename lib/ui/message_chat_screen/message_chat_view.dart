import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_input_text.dart';
import 'package:wishden/app/styels/ui_helper.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/ui/message_chat_screen/message_chat_viewmodel.dart';
import 'package:wishden/ui/message_chat_screen/widget/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

class MessageChatScreenView extends StatefulWidget {
  const MessageChatScreenView({super.key});

  @override
  State<MessageChatScreenView> createState() => _MessageChatScreenViewState();
}

class _MessageChatScreenViewState extends State<MessageChatScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessageChatScreenViewModel>.reactive(
        viewModelBuilder: () => MessageChatScreenViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              resizeToAvoidBottomInset: true,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  child: SafeArea(
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                locator<GoRouter>().pop();
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.grayColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Icon(
                                  Iconsax.arrow_left_copy,
                                  size: 20,
                                ),
                              ),
                            ),
                            horizontalSpaceSmall,
                            const CircleAvatar(
                              radius: 20,
                            ),
                            horizontalSpaceSmall,
                            Text(
                              "Skyline",
                              style: subHeaderTextStyle.copyWith(
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                        gapMedium,
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(10),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: model.messages.length,
                            itemBuilder: (context, index) {
                              final message = model.messages[index];
                              return ChatBubble(
                                message: message['message'],
                                isSender: message['isSender'],
                                isReservation: message['isReservation'],
                              );
                            },
                          ),
                        ),
                        gapMedium,
                        gapLarge
                      ],
                    ),
                  ),
                ),
              ),
              floatingActionButton: Padding(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 0,
                ),
                child: CustomInputText(
                  inputType: TextInputType.text,
                  hint: "Write your message",
                  suffix: SizedBox(
                    width: screenWidth(context, 5),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Iconsax.happyemoji_copy,
                            size: 25,
                          ),
                          horizontalSpaceTiny,
                          Icon(
                            Iconsax.send_1,
                            color: AppColors.primary,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        });
  }
}
