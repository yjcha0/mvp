import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class FoodCategoryIcon extends StatelessWidget {
  final String iconImagePath;
  final String iconTitle;

  const FoodCategoryIcon(
      {super.key, required this.iconImagePath, required this.iconTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(iconTitle);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80.adaptSize,
            height: 80.adaptSize,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(iconImagePath),
              ),
              borderRadius: BorderRadius.circular(40.adaptSize),
              border: Border.all(color: Colors.black54, width: 2.0),
            ),
          ),
          Text(
            iconTitle,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 18.h,
            ),
          ),
        ],
      ),
    );
  }
}
