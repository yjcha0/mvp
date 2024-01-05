import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/screens/order_detail2_screen.dart';
import 'package:mvp/screens/shopping_bag_screen.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  static const String orderDetailTitle = '마늘';

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void _onCartPressed() {
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
                OrderDetailScreen.orderDetailTitle,
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
                  onPressed: _onCartPressed,
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: 20,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderDetailScreen2(),
                ),
              );
            },
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        image: AssetImage(ImageConstant.garlic),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "마늘 A",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.h,
                          ),
                        ),
                        Text(
                          "2,700원",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
