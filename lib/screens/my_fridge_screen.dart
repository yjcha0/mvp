import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/widgets/category_appbar.dart';

class MyFridgeScreen extends StatelessWidget {
  MyFridgeScreen({Key? key})
      : super(
          key: key,
        );

  static const String myFridgeTitle = 'My 냉장고';

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
          title: myFridgeTitle,
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
              SizedBox(height: 20.h),
              CategoryAppbar(
                text: "식재료 관리하기",
                onPressed: () {
                  Navigator.of(context)
                      .push(createLeftRightRouteTo(MyFridgeStockScreen()));
                },
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 21.h),
                child: CustomImageView(imagePath: 'assets/images/myFridge.png'),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      createBottomTopRouteTo(ConsumerReportScreen()));
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
                        "소비습관 파악하기!",
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
                      createBottomTopRouteTo(LifeHacksScreen()));
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
                        "냉장고 꿀팁!",
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
    );
  }
}
