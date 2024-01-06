import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvp/core/app_export.dart';

class MyFridgeStockDetailAdd extends StatelessWidget {
  MyFridgeStockDetailAdd({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static const String myFridgeStockTitle = '재료 등록하기';

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Future getImage(ImageSource imageSource) async {
      // ignore: unused_local_variable
      final pickedFile = await picker.pickImage(source: imageSource);
    }

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
          title: myFridgeStockTitle,
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
        body: SizedBox(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          child: Column(
            children: [
              SizedBox(height: 100.v),
              GestureDetector(
                onTap: () {
                  getImage(ImageSource.camera);
                },
                child: Container(
                  width: 300.adaptSize,
                  height: 300.adaptSize,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(150.adaptSize),
                    border: Border.all(width: 3.0.v),
                  ),
                  child: Icon(
                    Icons.camera_alt_rounded,
                    size: 80.adaptSize,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 70.v),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 180.h,
                  height: 50.v,
                  alignment: Alignment.center,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.v),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0.h),
                    borderRadius: BorderRadius.circular(20.0.h),
                  ),
                  child: Text(
                    '직접 정보 입력하기',
                    style:
                        TextStyle(fontSize: 15.h, fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
