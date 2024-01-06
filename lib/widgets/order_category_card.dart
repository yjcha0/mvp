import 'package:flutter/material.dart';
import "package:mvp/core/app_export.dart";
import "dart:math";

class OrderCategoryCard extends StatefulWidget {
  const OrderCategoryCard({
    super.key,
    required this.categoryToShow,
    this.onTap,
  });

  final List<Map<String, String>> categoryToShow;
  final Function()? onTap;

  @override
  State<OrderCategoryCard> createState() => _OrderCategoryCardState();
}

class _OrderCategoryCardState extends State<OrderCategoryCard> {
  bool showCategory = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        showCategory
            ? Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8.h, crossAxisCount: 5),
                  itemCount: widget.categoryToShow.length,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                    onTap: widget.onTap,
                    child: Column(
                      children: [
                        Container(
                          width: 70.adaptSize,
                          height: 70.adaptSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    widget.categoryToShow[index]['image']!)),
                            border: Border.all(
                              color: const Color(0xFFB6D9ED),
                              width: 2.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.v),
                        Expanded(
                          child: Text(
                            widget.categoryToShow[index]['category']!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: 130.adaptSize,
                  padding: EdgeInsets.only(
                    top: 20.h,
                    left: 10.v,
                    right: 10.v,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.categoryToShow.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10.h),
                            child: InkWell(
                              onTap: widget.onTap,
                              child: Column(
                                children: [
                                  Container(
                                    width: 70.adaptSize,
                                    height: 70.adaptSize,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              widget.categoryToShow[index]
                                                  ['image']!)),
                                      border: Border.all(
                                        color: const Color(0xFFB6D9ED),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.v),
                                    child: Text(
                                      widget.categoryToShow[index]['category']!,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
        SizedBox(
          height: 5.h,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              showCategory = !showCategory;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(right: 25.v),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "카테고리 전체 보기",
                  style: TextStyle(
                    fontSize: 15.h,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
