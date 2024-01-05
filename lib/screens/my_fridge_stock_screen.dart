import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class MyFridgeStockScreen extends StatelessWidget {
  MyFridgeStockScreen({Key? key}) : super(key: key);

  static const String myFridgeStockTitle = '식재료 관리';
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
              SizedBox(height: 10.v),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 21.h),
                  children: [
                    SizedBox(height: 20.v),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(createLeftRightRouteTo(
                            const MyFridgeStockDetailScreen1()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '유통기한이 다가와요!',
                            style: TextStyle(
                              fontSize: 18.h,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 30.adaptSize,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.v),
                    const IngredientCardWidget(
                      ingredientName: '양파 한망 묶음 (4개)',
                      expirationDate: '2023년 11월 02일',
                      expirationDetail: '일주일',
                      remainAmount: 200,
                      totalAmount: 400,
                    ),
                    SizedBox(height: 10.v),
                    const IngredientCardWidget(
                      ingredientName: '마늘 200g',
                      expirationDate: '2023년 10월 25일',
                      expirationDetail: '얼마 안',
                      remainAmount: 130,
                      totalAmount: 200,
                    ),
                    SizedBox(height: 50.v),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(createLeftRightRouteTo(
                            const MyFridgeStockDetailScreen2()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '잠깐! 이거 찾으세요?',
                            style: TextStyle(
                              fontSize: 18.h,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 30.adaptSize,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.v),
                    const IngredientFreqCard(
                      ingredientName: '당근 한 묶음 (6개)',
                      frequency: 2,
                      lastPurchase: '2023년 10월 12일',
                    ),
                    SizedBox(height: 10.v),
                    const IngredientFreqCard(
                      ingredientName: '콩나물 1 봉지',
                      frequency: 5,
                      lastPurchase: '2023년 10월 25일',
                    ),
                    SizedBox(height: 50.v),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(createLeftRightRouteTo(
                            const MyFridgeStockDetailScreen3()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '가지고 있는 재료들 보기',
                            style: TextStyle(
                              fontSize: 18.h,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 30.adaptSize,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.v),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FoodCategoryIcon(
                              iconImagePath: ImageConstant.salad,
                              iconTitle: '야채',
                            ),
                            FoodCategoryIcon(
                              iconImagePath: ImageConstant.meat,
                              iconTitle: '육류',
                            ),
                            FoodCategoryIcon(
                              iconImagePath: ImageConstant.fish,
                              iconTitle: '생선',
                            ),
                            FoodCategoryIcon(
                              iconImagePath: ImageConstant.egg,
                              iconTitle: '계란',
                            ),
                          ],
                        ),
                        SizedBox(height: 30.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FoodCategoryIcon(
                              iconImagePath: ImageConstant.dairy,
                              iconTitle: '유제품',
                            ),
                            FoodCategoryIcon(
                              iconImagePath: ImageConstant.bread,
                              iconTitle: '빵',
                            ),
                            FoodCategoryIcon(
                              iconImagePath: ImageConstant.nuts,
                              iconTitle: '견과류',
                            ),
                            FoodCategoryIcon(
                              iconImagePath: ImageConstant.fruit,
                              iconTitle: '과일',
                            ),
                          ],
                        ),
                        SizedBox(height: 30.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FoodCategoryIcon(
                              iconImagePath: ImageConstant.oil,
                              iconTitle: '오일',
                            ),
                            FoodCategoryIcon(
                              iconImagePath: ImageConstant.spices,
                              iconTitle: '향신료',
                            ),
                            FoodCategoryIcon(
                              iconImagePath: ImageConstant.beverage,
                              iconTitle: '음료',
                            ),
                            FoodCategoryIcon(
                              iconImagePath: ImageConstant.tableWare,
                              iconTitle: '식기류',
                            ),
                          ],
                        ),
                      ],
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
