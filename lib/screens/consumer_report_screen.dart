import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:intl/intl.dart';

class ConsumerReportScreen extends StatelessWidget {
  ConsumerReportScreen({Key? key}) : super(key: key);

  static const String myFridgeTitle = '소비 패턴 파악하기!';

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
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 20.h,
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
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "이번 달에만",
                      style: TextStyle(
                        fontSize: 25.h,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          NumberFormat.currency(locale: 'ko_KR', symbol: '₩')
                              .format(totalMoneySpent(chartDataList)),
                          style: TextStyle(
                            fontSize: 28.h,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5.h),
                        Text(
                          "만큼 썼어요",
                          style: TextStyle(
                            fontSize: 25.h,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.v),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      createLeftRightRouteTo(
                          const ConsumerReportDetailScreen()));
                },
                child: SizedBox(
                  height: mediaQueryData.size.width * 0.90,
                  width: mediaQueryData.size.width,
                  child: DonutChartWidget(
                      chartDataList,
                      NumberFormat.currency(locale: 'ko_KR', symbol: '₩')
                          .format(totalMoneySpent(chartDataList))),
                ),
              ),
              SizedBox(height: 15.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "저번 달보다",
                      style: TextStyle(
                        fontSize: 25.h,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          NumberFormat.currency(locale: 'ko_KR', symbol: '₩')
                              .format(23340),
                          style: TextStyle(
                            fontSize: 28.h,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5.h),
                        Text(
                          "절약했어요!",
                          style: TextStyle(
                            fontSize: 25.h,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
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
                      )
                    ],
                  ),
                ),
              ),
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
