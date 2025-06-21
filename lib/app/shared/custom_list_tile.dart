import 'package:flutter/material.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/helpers/constant/app_colors.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.leading,
    required this.ontap,
    this.trailing,
    this.isDelete = false,
  });
  final String title;
  final IconData leading;
  final Widget? trailing;
  final bool isDelete;
  final VoidCallback ontap;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            border: widget.isDelete
                ? Border.all(width: 1, color: AppColors.errorColor)
                : null,
            borderRadius: BorderRadius.circular(13)),
        child: ListTile(
          leading: Icon(
            widget.leading,
          ),
          title: Text(
            widget.title,
            style: bodyTextStyle.copyWith(
                color: widget.isDelete
                    ? AppColors.errorColor
                    : AppColors.normalBlack),
          ),
          trailing: widget.trailing,
        ),
      ),
    );
  }
}
