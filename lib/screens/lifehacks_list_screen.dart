import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class LifeHacksList extends StatefulWidget {
  const LifeHacksList({Key? key}) : super(key: key);

  static const String myFridgeStockTitle = 'parse title';

  @override
  State<LifeHacksList> createState() => _LifeHacksListState();
}

class _LifeHacksListState extends State<LifeHacksList> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool showFilter = false;
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
          title: LifeHacksList.myFridgeStockTitle,
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
                      hintText: "어떤 꿀팁을 찾아볼까요?",
                      controller: searchController,
                    ),
                  ),
                  SizedBox(width: 15.h),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showFilter = !showFilter;
                      });
                    },
                    child: Container(
                      width: 50.adaptSize,
                      height: 50.adaptSize,
                      padding: EdgeInsets.all(5.adaptSize),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.h),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            offset: Offset(0, 2.v),
                            blurRadius: 2.v,
                          )
                        ],
                      ),
                      child: Image.asset(ImageConstant.imgSlider),
                    ),
                  ),
                  SizedBox(width: 21.h),
                ],
              ),
              SizedBox(height: 10.v),
              Expanded(
                  child: Row(
                children: [
                  SizedBox(height: 10.v),
                  // ListView(),
                  // ListView(),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
