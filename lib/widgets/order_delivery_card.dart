import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/screens/order_detail4_screen.dart';

class OrderDeliveryCard extends StatefulWidget {
  const OrderDeliveryCard({super.key});

  @override
  State<OrderDeliveryCard> createState() => _OrderDeliveryCardState();
}

class _OrderDeliveryCardState extends State<OrderDeliveryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OrderDetailScreen4(),
          ),
        );
      },
      child: Container(
        width: 390.h,
        height: 162.h,
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
          padding: EdgeInsets.only(
            left: 20.h,
            right: 20.h,
            top: 10.h,
            bottom: 5.h,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "11. 20(수) *배달완료",
                    style: TextStyle(
                      fontSize: 12.h,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 55.h,
                        height: 14.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                        child: Text(
                          "주문상세",
                          style: TextStyle(
                            fontSize: 11.h,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      const Icon(
                        Icons.menu,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "마트 A",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.h,
                    ),
                  ),
                  Text(
                    "32,800원",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.h,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 13.h,
              ),
              Container(
                width: 352,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF6FC),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "다시 주문하기",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.h,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: 352,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF6FC),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "리뷰쓰기 ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.h,
                      ),
                    ),
                    Text(
                      "(3일 남음)",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14.h,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
