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
                    const IngredientCardWidget(
                      ingredientName: '양파 한망 묶음 (4개)',
                      expirationDate: '2023년 11월 02일',
                      expirationDetail: '얼마 안',
                      remainAmount: 200,
                      totalAmount: 400,
                    ),
                    SizedBox(height: 15.v),
                    const IngredientCardWidget(
                      ingredientName: '마늘 200g',
                      expirationDate: '2023년 10월 25일',
                      expirationDetail: '하루',
                      remainAmount: 130,
                      totalAmount: 200,
                    ),
                    SizedBox(height: 15.v),
                    const IngredientCardWidget(
                      ingredientName: '배추 한 포기',
                      expirationDate: '2023년 10월 11일',
                      expirationDetail: '이틀',
                      remainAmount: 200,
                      totalAmount: 250,
                    ),
                    SizedBox(height: 15.v),
                    const IngredientCardWidget(
                      ingredientName: '소고기 등심 600g',
                      expirationDate: '2023년 10월 27일',
                      expirationDetail: '4일',
                      remainAmount: 500,
                      totalAmount: 600,
                    ),
                    SizedBox(height: 15.v),
                    const IngredientCardWidget(
                      ingredientName: '돼지고기 삼겹살 450g',
                      expirationDate: '2023년 10월 21일',
                      expirationDetail: '일주일',
                      remainAmount: 100,
                      totalAmount: 450,
                    ),
                    SizedBox(height: 15.v),
                    const IngredientCardWidget(
                      ingredientName: '계란 한 판',
                      expirationDate: '2023년 9월 30일',
                      expirationDetail: '10일',
                      remainAmount: 9,
                      totalAmount: 30,
                    ),
                    SizedBox(height: 15.v),
                    const IngredientCardWidget(
                      ingredientName: '대파 한 단',
                      expirationDate: '2023년 10월 24일',
                      expirationDetail: '10일',
                      remainAmount: 135,
                      totalAmount: 180,
                    ),
                    SizedBox(height: 15.v),
                    const IngredientCardWidget(
                      ingredientName: '마늘 200g',
                      expirationDate: '2023년 11월 01일',
                      expirationDetail: '2주',
                      remainAmount: 130,
                      totalAmount: 200,
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
