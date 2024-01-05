import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class IngredientCardWidget extends StatelessWidget {
  final String ingredientName;
  final String expirationDate;
  final String expirationDetail;
  final int remainAmount;
  final int totalAmount;
  const IngredientCardWidget({
    super.key,
    required this.ingredientName,
    required this.expirationDate,
    required this.expirationDetail,
    required this.remainAmount,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context, createLeftRightRouteTo(const MyFridgeStockDetail4()));
      },
      child: Container(
        width: mediaQueryData.size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.v),
        // height: 100.v,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.h),
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400]!.withOpacity(0.9),
              offset: Offset(0, 3.v),
              blurRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ingredientName,
                  style: TextStyle(
                    fontSize: 18.h,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.v),
                Text(
                  expirationDate,
                  style: TextStyle(
                    fontSize: 15.h,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '유통기한이',
                      style: TextStyle(
                        fontSize: 15.h,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 5.h),
                    Text(
                      expirationDetail,
                      style: TextStyle(
                        fontSize: 15.h,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 5.h),
                    Text(
                      '남았어요!',
                      style: TextStyle(
                        fontSize: 15.h,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 10.v),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.h),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$remainAmount',
                        style: TextStyle(fontSize: 18.h, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Text(
                        '$totalAmount(g)',
                        style: TextStyle(
                            fontSize: 16.h, color: Colors.transparent),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$remainAmount',
                        style: TextStyle(
                            fontSize: 18.h, color: Colors.transparent),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Text(
                        '$totalAmount(g)',
                        style: TextStyle(fontSize: 16.h, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IngredientFreqCard extends StatelessWidget {
  final String ingredientName;
  final int frequency;
  final String lastPurchase;

  const IngredientFreqCard({
    super.key,
    required this.ingredientName,
    required this.frequency,
    required this.lastPurchase,
  });

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context, createLeftRightRouteTo(const MyFridgeStockDetail4()));
      },
      child: Container(
        width: mediaQueryData.size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.v),
        // height: 100.v,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.h),
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400]!.withOpacity(0.9),
              offset: Offset(0, 3.v),
              blurRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ingredientName,
                  style: TextStyle(
                    fontSize: 18.h,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.v),
                Row(
                  children: [
                    Text(
                      '지금까지',
                      style: TextStyle(
                        fontSize: 15.h,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 5.h),
                    Text(
                      '$frequency번',
                      style: TextStyle(
                        fontSize: 15.h,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 5.h),
                    Text(
                      '구매했어요',
                      style: TextStyle(
                        fontSize: 15.h,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Text(
                  '마지막 구매 일자 : $lastPurchase',
                  style: TextStyle(
                    fontSize: 15.h,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.v, vertical: 10.v),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.h),
              ),
              child: Icon(
                Icons.add_rounded,
                size: 40.adaptSize,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IngredientDetailCard extends StatelessWidget {
  final String imagePath;
  final String ingredientName;
  final String remainAmount;
  final String totalAmount;
  final String purchaseDate;
  final String expirationTip;

  const IngredientDetailCard({
    super.key,
    required this.imagePath,
    required this.ingredientName,
    required this.remainAmount,
    required this.totalAmount,
    required this.purchaseDate,
    required this.expirationTip,
  });

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SizedBox(
      width: mediaQueryData.size.width,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            createLeftRightRouteTo(
              MyFridgeStockDetail4(
                ingredientTitle: ingredientName,
                ingredientImgPath: imagePath,
                remainAmount: remainAmount,
                totalAmount: totalAmount,
                purchaseDate: purchaseDate,
                expirationDate: purchaseDate,
              ),
            ),
          );
        },
        child: SizedBox(
          width: mediaQueryData.size.width,
          child: Stack(
            children: [
              Container(
                width: mediaQueryData.size.width,
                height: 110.v,
                margin: EdgeInsets.only(top: 20.v),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20.adaptSize),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      offset: Offset(0, 3.v),
                      blurRadius: 5.adaptSize,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10.h),
                      Container(
                        width: 100.adaptSize,
                        height: 100.adaptSize,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(imagePath)),
                          borderRadius: BorderRadius.circular(50.adaptSize),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.9),
                              offset: Offset(0, 3.v),
                              blurRadius: 5.adaptSize,
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ingredientName,
                            style: TextStyle(
                              fontSize: 20.h,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5.v),
                          Row(
                            children: [
                              Text(
                                totalAmount,
                                style: TextStyle(
                                  fontSize: 18.h,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                ' 중 ',
                                style: TextStyle(
                                  fontSize: 18.h,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                remainAmount,
                                style: TextStyle(
                                  fontSize: 18.h,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                ' 남아있어요',
                                style: TextStyle(
                                  fontSize: 18.h,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '구매 일자 : ',
                                style: TextStyle(
                                  fontSize: 16.h,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                purchaseDate,
                                style: TextStyle(
                                  fontSize: 16.h,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 5.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10.h),
                      Text(
                        '구입일로부터 ',
                        style: TextStyle(
                          fontSize: 15.h,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        expirationTip,
                        style: TextStyle(
                          fontSize: 15.h,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        ' 동안이 가장 신선해요',
                        style: TextStyle(
                          fontSize: 15.h,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
