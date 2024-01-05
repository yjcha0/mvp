import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressMapScreen extends StatefulWidget {
  const AddressMapScreen({Key? key}) : super(key: key);

  static const String checkLocation = '지도에서 위치 확인';

  @override
  State<AddressMapScreen> createState() => _AddressMapScreenState();
}

class _AddressMapScreenState extends State<AddressMapScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        appBar: CustomAppBar(
          centerTitle: true,
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
          title: Text(
            AddressMapScreen.checkLocation,
            style: CustomTextStyles.titleLarge.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 7,
                bottom: 7,
                left: 18,
              ),
              child: Container(
                child: const Text(
                  "전북 전주시 덕진구 아중4길 22",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
                left: 18,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 22,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFD9D9D9),
                ),
                child: const Text(
                  "지번으로 보기",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 241, 235, 235),
          elevation: 0,
          padding: EdgeInsets.zero,
          child: CupertinoButton(
            borderRadius: BorderRadius.circular(10),
            onPressed: () {},
            color: const Color(0xFFB6D9ED),
            child: const Text(
              "이 위치로 주소 설정",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
