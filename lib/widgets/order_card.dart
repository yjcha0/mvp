import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class OrderCard extends StatelessWidget {
  final String foodImage;
  final String foodName;
  final Function()? onTap;
  final int date;
  final int gram;

  OrderCard({
    super.key,
    required this.foodImage,
    required this.foodName,
    this.onTap,
    required this.date,
    required this.gram,
  });

  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 170.adaptSize,
        height: 210.adaptSize,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 10.0,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 100.adaptSize,
              height: 100.adaptSize,
              child: Image(
                image: AssetImage(foodImage),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              foodName,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 20.adaptSize,
              ),
            ),
            SizedBox(
              height: 5.adaptSize,
            ),
            Text(
              "구매한 지 $date일 됐어요",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 15.adaptSize,
              ),
            ),
            Text(
              "현재 ${gram}g 남아있습니다",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 15.adaptSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
