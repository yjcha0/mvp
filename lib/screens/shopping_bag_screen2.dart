import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/screens/order_detail3_screen.dart';
import 'package:mvp/screens/shopping_bag_screen.dart';
import 'package:mvp/widgets/shopping_bag_card2.dart';

class ShoppingBagScreen2 extends StatefulWidget {
  const ShoppingBagScreen2({Key? key}) : super(key: key);

  static const String ShoppingBagTitle = '장바구니';

  @override
  State<ShoppingBagScreen2> createState() => _ShoppingBagScreen2State();
}

class _ShoppingBagScreen2State extends State<ShoppingBagScreen2> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
          title: ShoppingbagScreen.ShoppingBagTitle,
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
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 187,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    "정기배송",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.h,
                    ),
                  ),
                ),
                Container(
                  width: 187,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Color(0xFFB6D9ED),
                  ),
                  child: Text(
                    "일반배송",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.h,
                    ),
                  ),
                ),
              ],
            ),
            Column(
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
                  height: 110.h,
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
