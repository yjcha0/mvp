import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/screens/order_detail_screen.dart';

class OrderCard extends StatelessWidget {
  final String foodImage;
  final String foodName;

  const OrderCard({
    super.key,
    required this.foodImage,
    required this.foodName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OrderDetailScreen(),
          ),
        );
      },
      child: Container(
        width: 140,
        height: 200,
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
          padding: const EdgeInsets.all(9.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Color(0xFF999999),
                  ),
                ],
              ),
              SizedBox(
                width: 80,
                height: 70,
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
                  fontSize: 16.h,
                ),
              ),
              const Text("구매한지 2주나 됐어요"),
              const Text("현재 20g 남아있습니다"),
            ],
          ),
        ),
      ),
    );
  }
}
