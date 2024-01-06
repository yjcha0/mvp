import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/core/sizes.dart';
import 'package:mvp/screens/order_detail_screen.dart';
import 'package:mvp/screens/order_detail_screen2.dart';
import 'package:mvp/widgets/category_appbar.dart';
import 'package:mvp/widgets/order_card.dart';
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
          title: OrderScreen.orderTitle,
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
                        hintText: "주문하실 재료를 검색하세요..",
                        controller: searchController,
                      ),
                    ),
                    SizedBox(width: 15.h),
                    AppbarImage(svgPath: ImageConstant.imgSearch),
                    SizedBox(width: 21.h),
                  ],
                ),
                OrderCategoryCard(categoryToShow: categories),
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
                        date: 4,
                        gram: 20,
                      ),
                      SizedBox(
                        width: 20.h,
                      ),
                      OrderCard(
                        onTap: () {
                          Navigator.of(context).push(
                            createBottomTopRouteTo(
                              const OrderDetailScreen(),
                            ),
                          );
                        },
                        foodImage: ImageConstant.imgOrdergarlic,
                        foodName: "마늘",
                        date: 10,
                        gram: 10,
                      ),
                      SizedBox(
                        width: 20.h,
                      ),
                      OrderCard(
                        foodImage: ImageConstant.imgOrdermeat,
                        foodName: "돼지고기",
                        date: 2,
                        gram: 150,
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
