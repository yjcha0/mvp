import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class MyFridgeStockDetailScreen2 extends StatefulWidget {
  const MyFridgeStockDetailScreen2({Key? key}) : super(key: key);

  static const String myFridgeStockTitle = '이거 찾으세요?';

  @override
  State<MyFridgeStockDetailScreen2> createState() =>
      _MyFridgeStockDetailScreen2State();
}

class _MyFridgeStockDetailScreen2State
    extends State<MyFridgeStockDetailScreen2> {
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
          title: Align(
            alignment: Alignment.center,
            // margin: EdgeInsets.only(left: 21.h),
            child: Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Text(
                MyFridgeStockDetailScreen2.myFridgeStockTitle,
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
                        ? Container(
                            width: mediaQueryData.size.width,
                            height: 130.v,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage(ImageConstant.imgFridgeFilter),
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(height: 20.v),
                    const IngredientFreqCard(
                      ingredientName: '당근 한 묶음 (6개)',
                      frequency: 2,
                      lastPurchase: '2023년 10월 12일',
                    ),
                    SizedBox(height: 15.v),
                    const IngredientFreqCard(
                      ingredientName: '콩나물 1 봉지',
                      frequency: 5,
                      lastPurchase: '2023년 10월 25일',
                    ),
                    SizedBox(height: 15.v),
                    const IngredientFreqCard(
                      ingredientName: '소고기 꽃등심',
                      frequency: 6,
                      lastPurchase: '2023년 09월 24일',
                    ),
                    SizedBox(height: 15.v),
                    const IngredientFreqCard(
                      ingredientName: '다진 마늘',
                      frequency: 10,
                      lastPurchase: '2023년 11월 01일',
                    ),
                    SizedBox(height: 15.v),
                    const IngredientFreqCard(
                      ingredientName: '돼지고기 항정살',
                      frequency: 11,
                      lastPurchase: '2023년 08월 02일',
                    ),
                    SizedBox(height: 15.v),
                    const IngredientFreqCard(
                      ingredientName: '돼지고기 뒷다리살',
                      frequency: 20,
                      lastPurchase: '2023년 10월 17일',
                    ),
                    SizedBox(height: 15.v),
                    const IngredientFreqCard(
                      ingredientName: '콩나물 1 봉지',
                      frequency: 35,
                      lastPurchase: '2023년 10월 11일',
                    ),
                    SizedBox(height: 15.v),
                    const IngredientFreqCard(
                      ingredientName: '미원 1봉지 (소)',
                      frequency: 47,
                      lastPurchase: '2023년 08월 05일',
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
