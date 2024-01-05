import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class OrderDetailScreen4 extends StatefulWidget {
  const OrderDetailScreen4({Key? key}) : super(key: key);

  static const String OrderDetail3Title = '주문내역';

  @override
  State<OrderDetailScreen4> createState() => _OrderDetailScreen4State();
}

class _OrderDetailScreen4State extends State<OrderDetailScreen4> {
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
          title: Align(
            alignment: Alignment.center,
            // margin: EdgeInsets.only(left: 21.h),
            child: Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Text(
                OrderDetailScreen4.OrderDetail3Title,
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
                Container(
                  width: 390.h,
                  height: 220.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10.0,
                        offset: const Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.h,
                      vertical: 10.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "배달이 완료되었어요",
                          style: TextStyle(
                            fontSize: 12.h,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "마트 A",
                          style: TextStyle(
                            fontSize: 18.h,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "당근 외 3개",
                          style: TextStyle(
                            fontSize: 12.h,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "주문일시 : 2023년 11월 20일 오후 03:20",
                          style: TextStyle(
                            fontSize: 12.h,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "주문번호 : ABCDK2JD",
                          style: TextStyle(
                            fontSize: 12.h,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          width: 80.h,
                          height: 18.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            border: Border.all(
                              color: Colors.black,
                              width: 0.5,
                            ),
                          ),
                          child: Text(
                            "카드영수증 보기",
                            style: TextStyle(
                              fontSize: 10.h,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 175,
                              height: 34,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEAF6FC),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                "문의하기",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.h,
                                ),
                              ),
                            ),
                            Container(
                              width: 175,
                              height: 34,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEAF6FC),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                "마트보기",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 390.h,
              height: 220.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10.0,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              child: Image(
                image: AssetImage(
                  ImageConstant.order,
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 390.h,
              height: 76.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10.0,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15.h,
                  right: 15.h,
                  top: 10.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "총 결제금액",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "11,200",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "결제방법",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.h,
                          ),
                        ),
                        Text(
                          "카드결제",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.h,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "신한카드",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 10.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 390.h,
              height: 118.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10.0,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.h,
                  horizontal: 15.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "배달주소",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.h,
                      ),
                    ),
                    Text(
                      "전북 전주시 덕진구 아중4길 22",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12.h,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "전화번호",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.h,
                      ),
                    ),
                    Text(
                      "010-1234-4567",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
