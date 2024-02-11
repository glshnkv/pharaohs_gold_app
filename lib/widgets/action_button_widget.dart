import 'package:flutter/material.dart';
import 'package:pharaohs_gold_app/theme/colors.dart';

class ActionButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final double verticalPadding;
  final double horizontalPadding;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const ActionButtonWidget(
      {super.key,
      required this.onTap,
      required this.verticalPadding,
      required this.horizontalPadding,
      required this.text,
      required this.fontSize,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkBrown,
          border: Border.all(color: AppColors.lightBrown, width: 2),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding, horizontal: horizontalPadding),
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.ivory,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
