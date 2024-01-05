import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class ShoppingBagCard2 extends StatefulWidget {
  const ShoppingBagCard2({super.key});

  @override
  State<ShoppingBagCard2> createState() => _ShoppingBagCard2State();
}

class _ShoppingBagCard2State extends State<ShoppingBagCard2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 124,
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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 10.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 97,
              height: 98,
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
              child: Image(
                image: AssetImage(ImageConstant.imgPngegg91),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "양배추 1통",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.h,
                        ),
                      ),
                      const SizedBox(
                        width: 110,
                      ),
                      Text(
                        "3,000원",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.h,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "매월  둘째주  수요일  배송",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.h,
                        ),
                      ),
                      SizedBox(
                        width: 60.h,
                      ),
                      const Icon(
                        Icons.delete_outline,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
