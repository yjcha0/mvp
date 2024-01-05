import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class OnSaleCard extends StatefulWidget {
  OnSaleCard({
    super.key,
    required this.text,
    required this.image,
    required this.originalPrice,
    required this.sale,
    required this.price,
  });

  final int lowerLimit = 0;
  final int upperLimit = 99;
  final int stepValue = 1;
  int value = 0;
  final String text;
  final String image;
  final String originalPrice;
  final String sale;
  final String price;

  @override
  State<OnSaleCard> createState() => _OnSaleCardState();
}

class _OnSaleCardState extends State<OnSaleCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.adaptSize),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 220.adaptSize,
            height: 140.adaptSize,
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.adaptSize),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.text,
                        style: TextStyle(
                          fontSize: 20.adaptSize,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10.adaptSize,
                      ),
                      Text(
                        widget.originalPrice,
                        style: TextStyle(
                          fontSize: 18.adaptSize,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.adaptSize),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.sale,
                        style: TextStyle(
                          fontSize: 20.adaptSize,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 10.adaptSize,
                      ),
                      Text(
                        widget.price,
                        style: TextStyle(
                          fontSize: 18.adaptSize,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      color: Colors.black,
                      iconSize: 20.adaptSize,
                      onPressed: () {
                        setState(() {
                          widget.value = widget.value == widget.lowerLimit
                              ? widget.lowerLimit
                              : widget.value -= widget.stepValue;
                        });
                      },
                    ),
                    Container(
                      width: 35.adaptSize,
                      height: 35.adaptSize,
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
                        style: TextStyle(
                          fontSize: 20.adaptSize,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      color: Colors.black,
                      iconSize: 20.adaptSize,
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
          Positioned(
            right: 140.adaptSize,
            child: Container(
              height: 145.adaptSize,
              width: 145.adaptSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.image),
                ),
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: Colors.black12,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
