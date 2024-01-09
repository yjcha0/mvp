import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class MyFridgeStockDetailScreen1 extends StatefulWidget {
  const MyFridgeStockDetailScreen1({Key? key}) : super(key: key);

  static const String myFridgeStockTitle = '유통기한이 다가와요';

  @override
  State<MyFridgeStockDetailScreen1> createState() =>
      _MyFridgeStockDetailScreen1State();
}

class _MyFridgeStockDetailScreen1State
    extends State<MyFridgeStockDetailScreen1> {
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
          title: MyFridgeStockDetailScreen1.myFridgeStockTitle,
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
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 21.h),
                  children: [
                    showFilter
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            clipBehavior: Clip.none,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 5,
                              crossAxisSpacing: 10.h,
                              mainAxisSpacing: 15.v,
                              crossAxisCount: 3,
                            ),
                            itemCount: fridgeFilter.length,
                            itemBuilder: (BuildContext context, int index) =>
                                InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.h),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[400]!.withOpacity(0.9),
                                      offset: Offset(0, 3.v),
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    fridgeFilter[index]['title']!,
                                    style: TextStyle(
                                      fontSize: 17.h,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(height: 20.v),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: fridgeStockTitleList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return IngredientCardWidget(
                          stockTitle: fridgeStock[index]['title']!,
                          stockDate: fridgeStock[index]['date']!,
                          stockExpiration: fridgeStock[index]['expiration']!,
                          stockRemainAmount: fridgeStock[index]['amount']!,
                          stockTotalAmount: fridgeStock[index]['totalAmount']!,
                        );
                      },
                    ),
                    SizedBox(height: 50.v),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
