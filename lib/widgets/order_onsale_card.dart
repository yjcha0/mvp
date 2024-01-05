import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class OnSaleCard extends StatefulWidget {
  OnSaleCard({
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
  State<OnSaleCard> createState() => _OnSaleCardState();
}

class _OnSaleCardState extends State<OnSaleCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 160,
          height: 100,
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
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: '두부  ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '1000원',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "19% ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      " 990원",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
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
        Positioned(
          right: 100,
          child: CircleAvatar(
            backgroundImage: AssetImage(
              ImageConstant.imgOrdertofu,
            ),
            backgroundColor: Colors.white,
            radius: 52,
          ),
        ),
      ],
    );
  }
}
