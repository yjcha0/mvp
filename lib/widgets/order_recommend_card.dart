import 'package:flutter/material.dart';
import 'package:mvp/core/sizes.dart';

class OrderRecommendCard extends StatefulWidget {
  final String foodImage;
  final String foodName;

  OrderRecommendCard({
    super.key,
    required this.foodImage,
    required this.foodName,
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
  State<OrderRecommendCard> createState() => _OrderRecommendCardState();
}

class _OrderRecommendCardState extends State<OrderRecommendCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 206,
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
        padding: const EdgeInsets.all(7.0),
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
              height: 60,
              child: Image(
                image: AssetImage(widget.foodImage),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              widget.foodName,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16.h,
              ),
            ),
            Text(
              "990원",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 13.h,
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  color: Colors.black,
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
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  child: Text(
                    '${widget.value}',
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  color: Colors.black,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
