import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/screens/order_detail2_screen.dart';

class Order2DetailScreen extends StatefulWidget {
  const Order2DetailScreen({Key? key}) : super(key: key);

  static const String order2DetailTitle = '얼마 안남았어요';

  @override
  State<Order2DetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<Order2DetailScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void _onCartPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const OrderDetailScreen2(),
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
          title: Order2DetailScreen.order2DetailTitle,
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
          itemCount: garlicModel.length,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) => Column(
            children: [
              Expanded(
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(
                    image: AssetImage(garlicModel[index]['image']!),
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
                      garlicModel[index]['title']!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.h,
                      ),
                    ),
                    Text(
                      garlicModel[index]['price']!,
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
    );
  }
}
