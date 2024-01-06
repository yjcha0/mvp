import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

// import 'package:to_and_s_application/widgets/app_bar/appbar_title.dart';
// import 'package:to_and_s_application/widgets/app_bar/custom_app_bar.dart';

class HomeFridgeScreen extends StatelessWidget {
  HomeFridgeScreen({Key? key}) : super(key: key);

  final String appBarTitle = "    재료 관리는\n    여기서 한눈에 하자!";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: CustomAppBar(
          height: 120.v,
          titleAlign: Alignment.centerLeft,
          title: appBarTitle,
          actions: [
            Container(
              padding: EdgeInsets.only(right: 21.h, top: 30.v),
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
          ],
        ),
        endDrawer: const ProfileDrawer(),
        body: SizedBox(
          height: mediaQueryData.size.height,
          width: mediaQueryData.size.width,
          child: Padding(
            padding: EdgeInsets.only(top: 20.v),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgHomefridgeavocado,
                        height: 125.v,
                        width: 250.h,
                        fit: BoxFit.cover,
                        radius: BorderRadius.circular(16.h),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgHomefridgetomato,
                        height: 125.v,
                        width: 120.h,
                        radius: BorderRadius.circular(16.h),
                        margin: EdgeInsets.only(left: 15.h),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.v),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgHomefridgeingre,
                            height: 340.v,
                            width: 250.h,
                            radius: BorderRadius.circular(16.h),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                  createLeftRightRouteTo(MyFridgeScreen()));
                            },
                            child: Container(
                              height: 110.v,
                              width: 250.h,
                              padding: EdgeInsets.symmetric(horizontal: 10.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "My 냉장고",
                                        style: theme.textTheme.headlineMedium,
                                      ),
                                      Expanded(child: Container()),
                                      Icon(
                                        Icons.arrow_circle_right_outlined,
                                        size: 35.adaptSize,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.v),
                                  Text(
                                    "내가 가지고 있는 식재료 보러가기!",
                                    style: CustomTextStyles.bodyLargeGray60018,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.h),
                        child: Column(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgHomefridgemilk,
                              height: 300.v,
                              width: 120.h,
                              radius: BorderRadius.circular(
                                16.h,
                              ),
                            ),
                            SizedBox(height: 20.v),
                            CustomImageView(
                              imagePath: ImageConstant.imgHomefridgemeat,
                              height: 130.v,
                              width: 120.h,
                              radius: BorderRadius.circular(
                                16.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        createBottomTopRouteTo(const HomeRecipeScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10.v),
                    height: 80.v,
                    width: double.infinity,
                    decoration:
                        AppDecoration.gradientBlueToOnPrimaryContainer.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL30,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 5.v),
                        Container(
                          width: 60.h,
                          alignment: Alignment.center,
                          child: Divider(
                            thickness: 3,
                            height: 1,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        Text(
                          "레시피 추천",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        createBottomTopRouteTo(HomeOrderScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10.v),
                    height: 80.v,
                    width: double.infinity,
                    decoration:
                        AppDecoration.gradientBlueToOnPrimaryContainer.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL30,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 5.v),
                        Container(
                          width: 60.h,
                          alignment: Alignment.center,
                          child: Divider(
                            thickness: 3,
                            height: 1,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        Text(
                          "재료 주문하기",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
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
