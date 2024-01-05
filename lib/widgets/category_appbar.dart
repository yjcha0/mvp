import 'package:flutter/material.dart';
import 'package:mvp/core/sizes.dart';

class CategoryAppbar extends StatelessWidget {
  final Color? backgroundColor;
  final String text;
  final Color? textColor;
  final double? textSize;
  final Function() onPressed;
  final Color? iconColor;
  final double? iconSize;

  const CategoryAppbar({
    super.key,
    this.backgroundColor,
    required this.text,
    this.textColor,
    this.textSize,
    required this.onPressed,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        color: backgroundColor ?? Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 21.h,
            vertical: 15.v,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? Colors.black,
                  fontSize: textSize ?? 25.adaptSize,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                color: iconColor ?? Colors.black,
                size: iconSize ?? 40.adaptSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
