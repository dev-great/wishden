import 'package:flutter/material.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';

class ExpandableDescription extends StatefulWidget {
  final String text;

  const ExpandableDescription({super.key, required this.text});

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final int maxLines = _isExpanded ? 11 : 4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: bodyTextStyle),
        gapSmall,
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(
            _isExpanded ? "Read less" : "Read more",
            style: bodyTextStyle.copyWith(
                fontWeight: FontWeight.bold, color: AppColors.primary),
          ),
        )
      ],
    );
  }
}
