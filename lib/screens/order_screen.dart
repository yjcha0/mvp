import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/core/sizes.dart';
import 'package:mvp/screens/order_detail_screen2.dart';
import 'package:mvp/widgets/category_appbar.dart';
import 'package:mvp/widgets/order_card.dart';
import 'package:mvp/widgets/order_category_icon.dart';
import 'package:mvp/widgets/order_onsale_card.dart';
import 'package:mvp/widgets/order_recommend_card.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({
    Key? key,
    required this.address,
  }) : super(key: key);

  final String address;

  static const String orderTitle = '재료 주문하기';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final TextEditingController searchController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void _onPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Order2DetailScreen(),
      ),
    );
  }

  bool showCategory = false;

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
          leadingWidth: 34.adaptSize,
          title: Align(
            alignment: Alignment.center,
            // margin: EdgeInsets.only(left: 21.h),
            child: Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Text(
                OrderScreen.orderTitle,
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
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Icon(Icons.shopping_cart_outlined)],
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 10.h,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 30.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.address,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppbarSearchview(
                        padding: EdgeInsets.only(left: 21.h),
                        width: 300.h,
                        hintText: "주소를 입력하세요..",
                        controller: searchController,
                      ),
                    ),
                    SizedBox(width: 15.h),
                    AppbarImage(svgPath: ImageConstant.imgSearch),
                    SizedBox(width: 21.h),
                  ],
                ),
                showCategory
                    ? GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemCount: 12,
                        itemBuilder: (BuildContext context, int index) {
                          return OrderCategoryIcon(
                            iconImagePath: ImageConstant.imgImage52,
                            iconTitle: '소스/조미료',
                          );
                        },
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 30.h,
                            bottom: 10.h,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15.h,
                              ),
                              OrderCategoryIcon(
                                iconImagePath: ImageConstant.imgImage4539x42,
                                iconTitle: '채소',
                              ),
                              SizedBox(
                                width: 15.h,
                              ),
                              OrderCategoryIcon(
                                iconImagePath: ImageConstant.imgImage4642x42,
                                iconTitle: '육류',
                              ),
                              SizedBox(
                                width: 15.h,
                              ),
                              OrderCategoryIcon(
                                iconImagePath: ImageConstant.imgImage4742x42,
                                iconTitle: '유제품',
                              ),
                              SizedBox(
                                width: 15.h,
                              ),
                              OrderCategoryIcon(
                                iconImagePath: ImageConstant.imgImage4842x42,
                                iconTitle: '계란',
                              ),
                              SizedBox(
                                width: 15.h,
                              ),
                              OrderCategoryIcon(
                                iconImagePath: ImageConstant.imgImage4942x42,
                                iconTitle: '물/음료',
                              ),
                              SizedBox(
                                width: 15.h,
                              ),
                              OrderCategoryIcon(
                                iconImagePath: ImageConstant.imgImage5042x42,
                                iconTitle: '빵',
                              ),
                              SizedBox(
                                width: 15.h,
                              ),
                              OrderCategoryIcon(
                                iconImagePath: ImageConstant.imgImage52,
                                iconTitle: '소스/조미료',
                              ),
                              SizedBox(
                                width: 15.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                SizedBox(
                  height: 5.h,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showCategory = !showCategory;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 25.v),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "카테고리 전체 보기",
                          style: TextStyle(
                            fontSize: 15.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CategoryAppbar(
                  text: "얼마 안남았어요",
                  onPressed: _onPressed,
                ),
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20.h,
                      ),
                      OrderCard(
                        foodImage: ImageConstant.imgOrderwelshonion,
                        foodName: "대파",
                      ),
                      SizedBox(
                        width: 20.h,
                      ),
                      OrderCard(
                        foodImage: ImageConstant.imgOrdergarlic,
                        foodName: "마늘",
                      ),
                      SizedBox(
                        width: 20.h,
                      ),
                      OrderCard(
                        foodImage: ImageConstant.imgOrdermeat,
                        foodName: "돼지고기",
                      ),
                      SizedBox(
                        width: 20.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CategoryAppbar(
                  text: "우리 동네 특가 세일",
                  onPressed: () {},
                ),
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80.v,
                      ),
                      OnSaleCard(
                        text: "두부",
                        image: ImageConstant.imgOrdertofu,
                        originalPrice: "1000원",
                        sale: "19%",
                        price: "990원",
                      ),
                      SizedBox(
                        width: 80.v,
                      ),
                      OnSaleCard(
                        text: "라면",
                        image: ImageConstant.imgOrderramen,
                        originalPrice: "1000원",
                        sale: "19%",
                        price: "990원",
                      ),
                      SizedBox(
                        width: 80.v,
                      ),
                      OnSaleCard(
                        text: "감자칩",
                        image: ImageConstant.imgOrderchips,
                        originalPrice: "1000원",
                        sale: "19%",
                        price: "990원",
                      ),
                      SizedBox(
                        width: 30.v,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CategoryAppbar(
                  text: "우리 동네 추천 상품",
                  onPressed: () {},
                ),
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20.h,
                      ),
                      OrderRecommendCard(
                        foodImage: ImageConstant.imgOrderbread,
                        foodName: "식빵",
                        lowerLimit: 0,
                        upperLimit: 20,
                        stepValue: 1,
                        value: 0,
                      ),
                      SizedBox(
                        width: 20.h,
                      ),
                      OrderRecommendCard(
                        foodImage: ImageConstant.imgOrderegg,
                        foodName: "달걀",
                        lowerLimit: 0,
                        upperLimit: 20,
                        stepValue: 1,
                        value: 0,
                      ),
                      SizedBox(
                        width: 20.h,
                      ),
                      OrderRecommendCard(
                        foodImage: ImageConstant.imgOrderjuice,
                        foodName: "쥬스",
                        lowerLimit: 0,
                        upperLimit: 20,
                        stepValue: 1,
                        value: 0,
                      ),
                      SizedBox(
                        width: 20.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
