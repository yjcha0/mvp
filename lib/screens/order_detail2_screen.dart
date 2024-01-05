import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/screens/shopping_bag_screen.dart';

class OrderDetailScreen2 extends StatefulWidget {
  const OrderDetailScreen2({Key? key}) : super(key: key);

  static const String orderDetail2Title = '늘푸른 마늘';

  @override
  State<OrderDetailScreen2> createState() => _OrderDetailScreen2State();
}

class _OrderDetailScreen2State extends State<OrderDetailScreen2>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,
    animationDuration: const Duration(milliseconds: 300),
  );

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void _onCart2Pressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ShoppingbagScreen(),
      ),
    );
  }

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
          title: Align(
            alignment: Alignment.center,
            // margin: EdgeInsets.only(left: 21.h),
            child: Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Text(
                OrderDetailScreen2.orderDetail2Title,
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
                child: IconButton(
                  onPressed: _onCart2Pressed,
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70,
                  height: 300,
                  child: Image(
                    image: AssetImage(ImageConstant.remove),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 230,
                  child: Image(
                    image: AssetImage(ImageConstant.imgOrdergarlic),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 70,
                  height: 300,
                  child: Image(
                    image: AssetImage(ImageConstant.plus),
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                width: 390,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 0.5,
                      blurRadius: 5.0,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text(
                            "늘푸른 마늘",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.h,
                            ),
                          ),
                          Text(
                            " 180g",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.h,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            "31% ",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.h,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "1,720원 ",
                              style: TextStyle(
                                fontSize: 16.h,
                                color: Colors.black,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '2,500원',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                            height: 15,
                            child: Image(
                              image: AssetImage(ImageConstant.imgImage105),
                            ),
                          ),
                          Text(
                            " 4.9",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.h,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "현재 냉장고에 없습니다",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.h,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Column(
              children: [
                TabBar(
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2.5),
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: const Color(0xFF08A6FF),
                  indicatorWeight: 2,
                  labelColor: Colors.black,
                  labelStyle: TextStyle(
                    fontSize: 16.h,
                  ),
                  controller: tabController,
                  tabs: const [
                    Tab(text: "상세내용"),
                    Tab(text: "Reviews"),
                  ],
                ),
                const SizedBox(
                  height: 110,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 35,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 17.h,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "4,800원",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 235,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF6FC),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        border: Border.all(
                          color: const Color(0xFF15A0EE),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
