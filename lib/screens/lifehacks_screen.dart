import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class LifeHacksScreen extends StatelessWidget {
  LifeHacksScreen({Key? key})
      : super(
          key: key,
        );

  static const String myFridgeTitle = '냉장고 꿀팁!';

  final TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
                myFridgeTitle,
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
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RecipeCategoryText(
                      '냉장고 정리',
                      fontsize: 16,
                    ),
                    RecipeCategoryText(
                      '재료 보관법',
                      fontcolor: Colors.black,
                      fontsize: 18,
                    ),
                    RecipeCategoryText(
                      '식기 관리법',
                      fontsize: 16,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              Expanded(
                  child: HorizontalSlider(lifehackImgList, lifehackTitleList,
                      duration: 6)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, createLeftRightRouteTo(const LifeHacksList()));
                },
                child: Container(
                  height: 100.v,
                  // width: 250.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "나만의 꿀팁을 공유해보세요!",
                        style: theme.textTheme.headlineMedium,
                      ),
                      SizedBox(height: 10.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "더 많은 꿀팁 보러가기",
                            style: CustomTextStyles.bodyLargeGray60018,
                          ),
                          SizedBox(width: 5.h),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 25.adaptSize,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.v),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      createBottomTopRouteTo(MyFridgeScreen()));
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
                        "식재료 관리하기!",
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
                        "소비 패턴 파악하기!",
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
