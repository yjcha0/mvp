import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class ConsumerReportDetailScreen extends StatefulWidget {
  const ConsumerReportDetailScreen({super.key});

  @override
  State<ConsumerReportDetailScreen> createState() =>
      _ConsumerReportDetailScreenState();
}

class _ConsumerReportDetailScreenState
    extends State<ConsumerReportDetailScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final String consumerReportTitle = '소비 리포트';
  bool showCalendar = true;

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
          title: consumerReportTitle,
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
        body: Container(
          height: mediaQueryData.size.height,
          width: mediaQueryData.size.width,
          padding: EdgeInsets.symmetric(horizontal: 8.h),
          child: Column(
            children: [
              Container(
                // height: 20.h,
                padding: EdgeInsets.symmetric(horizontal: 21.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showCalendar = true;
                        });
                      },
                      child: Text(
                        '달력으로 보기',
                        style: TextStyle(
                            fontSize: 18.h,
                            fontWeight: FontWeight.bold,
                            color: showCalendar ? Colors.black : Colors.grey),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showCalendar = false;
                        });
                      },
                      child: Text(
                        '차트로 보기',
                        style: TextStyle(
                            fontSize: 18.h,
                            fontWeight: FontWeight.bold,
                            color: showCalendar ? Colors.grey : Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              showCalendar
                  ? const Expanded(child: ConsumerReportCalendarWidget())
                  : Column(
                      children: [
                        const ConsumerReportChartWidget(),
                        SizedBox(height: 15.v),
                        Container(
                          width: mediaQueryData.size.width,
                          padding: EdgeInsets.symmetric(horizontal: 13.h),
                          alignment: Alignment.center,
                          child: Text('각 항목을 터치하여 금액을 확인하세요!',
                              style: TextStyle(
                                  fontSize: 20.h,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600])),
                        )
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
