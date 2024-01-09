import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/widgets/category_appbar.dart';

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
          title: myFridgeStockTitle,
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
                  children: [
                    SizedBox(height: 20.v),
                    CategoryAppbar(
                      text: "유통기한이 다가와요!",
                      onPressed: () {
                        Navigator.of(context).push(createLeftRightRouteTo(
                            const MyFridgeStockDetailScreen1()));
                      },
                    ),
                    SizedBox(height: 10.v),
                    const IngredientCardWidget(
                      stockTitle: '양파 한망 묶음 (4개)',
                      stockDate: '2023년 11월 02일',
                      stockExpiration: 7,
                      stockRemainAmount: 200,
                      stockTotalAmount: 400,
                    ),
                    SizedBox(height: 10.v),
                    const IngredientCardWidget(
                      stockTitle: '마늘 200g',
                      stockDate: '2023년 10월 25일',
                      stockExpiration: 2,
                      stockRemainAmount: 130,
                      stockTotalAmount: 200,
                    ),
                    SizedBox(height: 50.v),
                    CategoryAppbar(
                      text: "잠깐! 이거 찾으세요?",
                      onPressed: () {
                        Navigator.of(context).push(createLeftRightRouteTo(
                            const MyFridgeStockDetailScreen2()));
                      },
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
                    CategoryAppbar(
                      text: "가지고 있는 재료들 보기",
                      onPressed: () {
                        Navigator.of(context).push(createLeftRightRouteTo(
                            const MyFridgeStockDetailScreen3()));
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 21.h),
                      child: Text(
                        "식재료",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.h,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.v),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        clipBehavior: Clip.none,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 8.h, crossAxisCount: 5),
                        itemCount: FridgeCategories.length,
                        itemBuilder: (BuildContext context, int index) =>
                            InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: 70.adaptSize,
                                height: 70.adaptSize,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          FridgeCategories[index]['image']!)),
                                  border: Border.all(
                                    color: const Color(0xFFB6D9ED),
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.v),
                              Expanded(
                                child: Text(
                                  FridgeCategories[index]['category']!,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 21.h),
                      child: Text(
                        "조미료",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.h,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.v),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        clipBehavior: Clip.none,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 8.h, crossAxisCount: 5),
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) =>
                            InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: 70.adaptSize,
                                height: 70.adaptSize,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          FridgeCategories[index]['image']!)),
                                  border: Border.all(
                                    color: const Color(0xFFB6D9ED),
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.v),
                              Expanded(
                                child: Text(
                                  FridgeCategories[index]['category']!,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
