import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class MyFridgeStockDetailScreen3 extends StatefulWidget {
  const MyFridgeStockDetailScreen3({Key? key}) : super(key: key);

  static const String myFridgeStockTitle = '가지고 있어요';

  @override
  State<MyFridgeStockDetailScreen3> createState() =>
      _MyFridgeStockDetailScreen3State();
}

class _MyFridgeStockDetailScreen3State
    extends State<MyFridgeStockDetailScreen3> {
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
                MyFridgeStockDetailScreen3.myFridgeStockTitle,
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
                    IngredientDetailCard(
                      imagePath: ImageConstant.imgEllipse11,
                      ingredientName: '양파 한 망 묶음 (4개)',
                      remainAmount: '3개',
                      totalAmount: '4개',
                      purchaseDate: '2023년 3월  18일',
                      expirationTip: '2주일',
                    ),
                    SizedBox(height: 20.v),
                    IngredientDetailCard(
                      imagePath: ImageConstant.imgEllipse12,
                      ingredientName: '닭가슴살',
                      remainAmount: '230g',
                      totalAmount: '1000g',
                      purchaseDate: '2023년 09월 29일',
                      expirationTip: '한 달',
                    ),
                    SizedBox(height: 20.v),
                    IngredientDetailCard(
                      imagePath: ImageConstant.imgEllipse13,
                      ingredientName: '분말 카레',
                      remainAmount: '330g',
                      totalAmount: '800g',
                      purchaseDate: '2023년 04월 01일',
                      expirationTip: '반 년',
                    ),
                    SizedBox(height: 20.v),
                    IngredientDetailCard(
                      imagePath: ImageConstant.imgEllipse1380x80,
                      ingredientName: '천일염',
                      remainAmount: '990g',
                      totalAmount: '1890g',
                      purchaseDate: '2022년 11월 11일',
                      expirationTip: '2년',
                    ),
                    SizedBox(height: 20.v),
                    IngredientDetailCard(
                      imagePath: ImageConstant.imgEllipse35,
                      ingredientName: '무염 버터',
                      remainAmount: '240g',
                      totalAmount: '400g',
                      purchaseDate: '2023년 06월 18일',
                      expirationTip: '2달',
                    ),
                    SizedBox(height: 20.v),
                    IngredientDetailCard(
                      imagePath: ImageConstant.imgEllipse36,
                      ingredientName: '카카오 파우더',
                      remainAmount: '30g',
                      totalAmount: '40g',
                      purchaseDate: '2023년 01월 23일',
                      expirationTip: '3개월',
                    ),
                    SizedBox(height: 20.v),
                    IngredientDetailCard(
                      imagePath: ImageConstant.imgEllipse11,
                      ingredientName: '마늘 한 접',
                      remainAmount: '4개',
                      totalAmount: '20개',
                      purchaseDate: '2023년 07월 08일',
                      expirationTip: '3주일',
                    ),
                    SizedBox(height: 20.v),
                    IngredientDetailCard(
                      imagePath: ImageConstant.imgEllipse41,
                      ingredientName: '상추 200g',
                      remainAmount: '20g',
                      totalAmount: '200g',
                      purchaseDate: '2023년 10월 23일',
                      expirationTip: '이틀',
                    ),
                    SizedBox(height: 50.v),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, createLeftRightRouteTo(MyFridgeStockDetailAdd()));
          },
          backgroundColor: const Color(0xffb6d9ed),
          child: Icon(
            Icons.add_rounded,
            size: 50.adaptSize,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
