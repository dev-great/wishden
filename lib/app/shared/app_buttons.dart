// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/styels/ui_helper.dart';
import 'package:wishden/helpers/constant/app_colors.dart';

class PrimaryBtn extends StatelessWidget {
  PrimaryBtn({
    super.key,
    this.color,
    this.textColor,
    this.isIcon,
    this.image,
    this.width,
    this.height,
    this.borderColor,
    this.iconColor,
    this.isImage,
    this.icon,
    this.boderRaduis,
    this.isLoading,
    required this.title,
    required this.onPress,
  });

  Color? color;
  Color? iconColor;
  bool? isIcon;
  bool? isImage;
  double? height;
  double? width;
  Color? borderColor;
  final double? boderRaduis;
  IconData? icon;
  String? image;
  Color? textColor;
  bool? isLoading;
  final String title;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: SizedBox(
        child: Container(
          height: height ?? 60,
          width: width ?? screenWidth(context, 1.1),
          decoration: BoxDecoration(
              color: color ?? AppColors.primary,
              borderRadius: BorderRadius.circular(boderRaduis ?? 25),
              border: Border.all(
                  width: 1.5, color: borderColor ?? AppColors.primary)),
          child: Center(
            child: isLoading == true
                ? const Center(
                    child: CupertinoActivityIndicator(
                      color: AppColors.white,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isImage == true
                          ? Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                height: 25,
                                width: 28,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(image!),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      isIcon == true
                          ? Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Icon(
                                icon,
                                size: 18,
                                color: iconColor,
                              ),
                            )
                          : Container(),
                      Text(title,
                          style: bodyTextStyle.copyWith(
                            color: textColor ?? AppColors.white,
                            decoration: TextDecoration.none,
                          )),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
