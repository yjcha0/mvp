import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class OrderCategoryIcon extends StatelessWidget {
  final String iconImagePath;
  final String iconTitle;

  const OrderCategoryIcon(
      {super.key, required this.iconImagePath, required this.iconTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70.adaptSize,
            height: 70.adaptSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(
                  iconImagePath,
                ),
              ),
              border: Border.all(
                color: const Color(0xFFB6D9ED),
                width: 2.0,
              ),
            ),
          ),
          Text(
            iconTitle,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 15.h,
            ),
          ),
        ],
      ),
    );
  }
}
