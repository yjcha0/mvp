import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/screens/address_setting_screen.dart';
import 'package:mvp/screens/order_screen.dart';

class HomeOrderScreen extends StatelessWidget {
  HomeOrderScreen({Key? key}) : super(key: key);

  final String currAddress = "서울특별시 중랑구 답십리로 81길 10";

  final TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        appBar: CustomAppBar(
          height: 120.v,
          title: Align(
            alignment: Alignment.centerLeft,
            // margin: EdgeInsets.only(left: 21.h),
            child: Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: CupertinoButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const AddressSettingScreen(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      currAddress,
                      style: CustomTextStyles.titleLarge.copyWith(
                        color: appTheme.black900,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 32.adaptSize,
                      color: Colors.black,
                    ),
                  ],
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
          height: mediaQueryData.size.height,
          width: mediaQueryData.size.width,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppbarSearchview(
                      padding: EdgeInsets.only(left: 21.h),
                      width: 300.h,
                      hintText: "찾으시는 재료를 입력하세요..",
                      controller: searchController,
                    ),
                  ),
                  SizedBox(width: 15.h),
                  AppbarImage(svgPath: ImageConstant.imgSearch),
                  SizedBox(width: 21.h),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.h, top: 20.v, bottom: 20.v),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgHomeorderimage,
                          height: 420.v,
                          width: 250.h,
                          radius: BorderRadius.circular(16.h),
                        ),
                        SizedBox(height: 10.h),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              createBottomTopRouteTo(
                                OrderScreen(
                                  address: currAddress,
                                ),
                              ),
                            );
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
                                      "재료 주문하기",
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
                                  "재료는 요리의 기본!",
                                  style: CustomTextStyles.bodyLargeGray60018,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 520.v,
                      width: 120.h,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onError,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20.h),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      createBottomTopRouteTo(HomeFridgeScreen()));
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
                        "냉장고 확인하기",
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
            ],
          ),
        ),
      ),
    );
  }
}
