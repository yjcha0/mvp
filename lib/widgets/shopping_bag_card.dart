import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/screens/shopping_bag_screen2.dart';

class ShoppingbagCard extends StatefulWidget {
  ShoppingbagCard({
    super.key,
    required this.lowerLimit,
    required this.upperLimit,
    required this.stepValue,
    required this.value,
  });

  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  int value;

  @override
  State<ShoppingbagCard> createState() => _ShoppingbagCardState();
}

class _ShoppingbagCardState extends State<ShoppingbagCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 157,
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
          vertical: 8.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: Container(
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
                      image: AssetImage(ImageConstant.imgPngegg81),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        "당근 한 묶음(4개)",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.h,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          color: const Color(0xFF999999),
                          iconSize: 15,
                          onPressed: () {
                            setState(() {
                              widget.value = widget.value == widget.lowerLimit
                                  ? widget.lowerLimit
                                  : widget.value -= widget.stepValue;
                            });
                          },
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFFEAF6FC),
                          ),
                          child: Text(
                            '${widget.value}',
                            style: const TextStyle(
                              fontSize: 17,
                              color: Color(0xFF999999),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          color: const Color(0xFF999999),
                          iconSize: 15,
                          onPressed: () {
                            setState(
                              () {
                                widget.value = widget.value == widget.upperLimit
                                    ? widget.upperLimit
                                    : widget.value += widget.stepValue;
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        Text(
                          "1,800원",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.h,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShoppingBagScreen2(),
                  ),
                );
              },
              child: Container(
                width: 352,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF6FC),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "정기배송으로 받기",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
