import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class MyFridgeStockDetail4 extends StatelessWidget {
  MyFridgeStockDetail4(
      {super.key,
      required this.ingredientTitle,
      required this.ingredientImgPath,
      required this.remainAmount,
      required this.totalAmount,
      required this.purchaseDate,
      required this.expirationDate});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final String myFridgeStockTitle = "재료 상세 페이지";

  final String ingredientTitle;
  final String ingredientImgPath;
  final String remainAmount;
  final String totalAmount;
  final String purchaseDate;
  final String expirationDate;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: CustomAppBar(
          height: 120.v,
          leading: Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.only(left: 21.h),
              child: AppbarImage(
                svgPath: ImageConstant.imgBackbutton,
                onTap: () => Navigator.pop(context),
              ),
            ),
          ),
          leadingWidth: 21.h + 10.adaptSize,
          title: Align(
            alignment: Alignment.center,
            // margin: EdgeInsets.only(left: 21.h),
            child: Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Text(
                myFridgeStockTitle,
                style: CustomTextStyles.titleLarge.copyWith(
                  color: appTheme.black900,
                ),
              ),
            ),
          ),
          actions: [
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.only(right: 21.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppbarImage(svgPath: ImageConstant.imgNotification),
                    SizedBox(width: 15.h),
                    AppbarImage(
                      svgPath: ImageConstant.imgUser,
                      onTap: () => scaffoldKey.currentState!.openEndDrawer(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        endDrawer: const ProfileDrawer(),
        body: SizedBox(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.h),
            child: Stack(
              children: [
                Container(
                  width: mediaQueryData.size.width,
                  height: mediaQueryData.size.height - 350.v,
                  margin: EdgeInsets.only(top: 100.v),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 3.0.v),
                  ),
                ),
                SizedBox(
                  width: mediaQueryData.size.width,
                  height: mediaQueryData.size.height,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 21.h),
                        child: Column(
                          children: [
                            Container(
                              width: mediaQueryData.size.width,
                              height: 400.v,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(ingredientImgPath)),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ingredientTitle,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23.h,
                                  ),
                                ),
                                Row(children: [
                                  Text(
                                    remainAmount,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 23.h,
                                    ),
                                  ),
                                  Text(
                                    ' / ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 23.h,
                                    ),
                                  ),
                                  Text(
                                    totalAmount,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 23.h,
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                            SizedBox(height: 10.v),
                            Row(
                              children: [
                                SizedBox(width: 5.h),
                                Text(
                                  '구매 일자 : ',
                                  style: TextStyle(fontSize: 18.h),
                                ),
                                Text(
                                  purchaseDate,
                                  style: TextStyle(fontSize: 18.h),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 5.h),
                                Text(
                                  '유통 기한 : ',
                                  style: TextStyle(fontSize: 18.h),
                                ),
                                Text(
                                  expirationDate,
                                  style: TextStyle(fontSize: 18.h),
                                ),
                              ],
                            ),
                            SizedBox(height: 30.v),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.h, vertical: 15.v),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 2.0.v),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant.imgRecipe,
                                          width: 60.adaptSize,
                                          height: 60.adaptSize,
                                        ),
                                        SizedBox(
                                          height: 10.v,
                                        ),
                                        Text(
                                          '레시피',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 15.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.h, vertical: 15.v),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 2.0.v),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant.imgStats,
                                          width: 60.adaptSize,
                                          height: 60.adaptSize,
                                        ),
                                        SizedBox(
                                          height: 10.v,
                                        ),
                                        Text(
                                          '영양성분',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 15.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.h, vertical: 15.v),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 2.0.v),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant.imgHistory,
                                          width: 60.adaptSize,
                                          height: 60.adaptSize,
                                        ),
                                        SizedBox(
                                          height: 10.v,
                                        ),
                                        Text(
                                          '사용 내역',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 15.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.v),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 25.v),
                          width: mediaQueryData.size.width,
                          decoration: const BoxDecoration(
                            color: Color(0xffb6d9ed),
                          ),
                          child: Text(
                            '구매하기',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.h,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
