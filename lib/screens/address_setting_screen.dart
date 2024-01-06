import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/screens/address_map_screen.dart';
import 'package:mvp/screens/store_setting_screen.dart';

class AddressSettingScreen extends StatefulWidget {
  const AddressSettingScreen({Key? key}) : super(key: key);

  static const String addressSettingTitle = '주소 설정';

  @override
  State<AddressSettingScreen> createState() => _AddressSettingScreenState();
}

class _AddressSettingScreenState extends State<AddressSettingScreen> {
  final TextEditingController searchController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void _onStoreTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const StoreSettingScreen(),
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
          title: AddressSettingScreen.addressSettingTitle,
          actions: [
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.only(right: 21.h),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "편집",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: SizedBox(
          height: mediaQueryData.size.height,
          width: mediaQueryData.size.width,
          child: Column(
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
              CupertinoButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const AddressMapScreen(),
                    ),
                  );
                },
                child: AppBar(
                  toolbarHeight: 20,
                  leadingWidth: 17,
                  centerTitle: false,
                  backgroundColor: Colors.white,
                  leading: const Icon(
                    Icons.flag_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: const Text(
                    "현재 위치로 설정",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  actions: const [
                    SizedBox(
                      width: 20,
                      child: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 20,
                decoration: const BoxDecoration(
                  color: Color(0xFFE9E9E9),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.home_outlined,
                      size: 30,
                    ),
                    title: Text(
                      "우리 집",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      "전북 전주시 덕진구 아중4길 22",
                      style: TextStyle(
                        color: Color(0xFF767676),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.home_outlined,
                      size: 30,
                    ),
                    title: Text(
                      "우리 집",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      "전북 전주시 덕진구 아중4길 22",
                      style: TextStyle(
                        color: Color(0xFF767676),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 241, 235, 235),
          elevation: 0,
          padding: EdgeInsets.zero,
          child: CupertinoButton(
            borderRadius: BorderRadius.circular(10),
            onPressed: _onStoreTap,
            color: const Color(0xFFB6D9ED),
            child: const Text(
              "내 주변 마트",
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
