import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/widgets/order_delivery_card.dart';

class OrderDetailScreen3 extends StatefulWidget {
  const OrderDetailScreen3({Key? key}) : super(key: key);

  static const String OrderDetail3Title = '주문내역';

  @override
  State<OrderDetailScreen3> createState() => _OrderDetailScreen3State();
}

class _OrderDetailScreen3State extends State<OrderDetailScreen3> {
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
          title: OrderDetailScreen3.OrderDetail3Title,
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
            SizedBox(
              height: 30.h,
            ),
            const OrderDeliveryCard(),
            SizedBox(
              height: 20.h,
            ),
            const OrderDeliveryCard(),
          ],
        ),
      ),
    );
  }
}
