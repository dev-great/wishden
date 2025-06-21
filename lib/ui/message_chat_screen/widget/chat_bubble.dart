import 'package:flutter/material.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSender;
  final bool isReservation;

  const ChatBubble({
    required this.message,
    required this.isSender,
    super.key,
    required this.isReservation,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: isSender ? AppColors.primary : AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: isSender ? const Radius.circular(20) : Radius.zero,
                bottomRight: isSender ? Radius.zero : const Radius.circular(20),
              ),
            ),
            child: isReservation
                ? Column(
                    crossAxisAlignment: isSender
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        message,
                        style: bodyTextStyle.copyWith(
                          color:
                              isSender ? AppColors.white : AppColors.deepBlack,
                        ),
                      ),
                      gapTiny,
                      Text(
                        "Table V1 >",
                        style: bodyTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      ),
                      gapTiny,
                      Text(
                        "12:22 PM",
                        textAlign: TextAlign.right,
                        style: tinyTextStyle.copyWith(
                          fontSize: 10,
                          color: AppColors.grayColor,
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: isSender
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        message,
                        style: bodyTextStyle.copyWith(
                          color:
                              isSender ? AppColors.white : AppColors.deepBlack,
                        ),
                      ),
                      gapTiny,
                      Text(
                        "12:22 PM",
                        textAlign: TextAlign.right,
                        style: tinyTextStyle.copyWith(
                          fontSize: 10,
                          color: AppColors.grayColor,
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
