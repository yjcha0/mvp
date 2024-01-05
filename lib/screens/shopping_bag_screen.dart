import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/screens/order_detail3_screen.dart';
import 'package:mvp/widgets/shopping_bag_card.dart';
import 'package:mvp/widgets/shopping_bag_card2.dart';

class ShoppingbagScreen extends StatefulWidget {
  const ShoppingbagScreen({Key? key}) : super(key: key);

  static const String ShoppingBagTitle = '장바구니';

  @override
  State<ShoppingbagScreen> createState() => _ShoppingbagScreenState();
}

class _ShoppingbagScreenState extends State<ShoppingbagScreen> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool showDeliveryService = false;

  void _onOrderPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const OrderDetailScreen3(),
      ),
    );
  }

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
                ShoppingbagScreen.ShoppingBagTitle,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 20.h,
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
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      showDeliveryService = !showDeliveryService;
                    });
                  },
                  child: Container(
                    width: 187,
                    height: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      color: showDeliveryService
                          ? const Color(0xFFB6D9ED)
                          : Colors.white,
                    ),
                    child: Text(
                      "정기배송",
                      style: TextStyle(
                        color:
                            showDeliveryService ? Colors.white : Colors.black,
                        fontSize: 18.h,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      showDeliveryService = !showDeliveryService;
                    });
                  },
                  child: Container(
                    width: 187,
                    height: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: showDeliveryService
                          ? Colors.white
                          : const Color(0xFFB6D9ED),
                    ),
                    child: Text(
                      "일반배송",
                      style: TextStyle(
                        color:
                            showDeliveryService ? Colors.black : Colors.white,
                        fontSize: 18.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            showDeliveryService
                ? Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const ShoppingBagCard2(),
                      const SizedBox(
                        height: 15,
                      ),
                      const ShoppingBagCard2(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: IconButton(
                              onPressed: _onOrderPressed,
                              icon: Icon(
                                Icons.add_circle,
                                color: const Color(0xFFB6D9ED),
                                size: 60.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 115.h,
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
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      ShoppingbagCard(
                        lowerLimit: 0,
                        upperLimit: 20,
                        stepValue: 1,
                        value: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ShoppingbagCard(
                        lowerLimit: 0,
                        upperLimit: 20,
                        stepValue: 1,
                        value: 1,
                      ),
                      const SizedBox(
                        height: 150,
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
