import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class LifeHacksDetail extends StatefulWidget {
  final String title;
  final String imagePath;

  const LifeHacksDetail(
      {Key? key, required this.title, required this.imagePath})
      : super(key: key);

  @override
  State<LifeHacksDetail> createState() => _LifeHacksDetailState();
}

class _LifeHacksDetailState extends State<LifeHacksDetail> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool showFilter = false;

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
                widget.title,
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
          // height: mediaQueryData.size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SinglePostHeader(
                    backgroundImagePath: widget.imagePath,
                    writter: 'The Rock',
                  ),
                  SizedBox(height: 20.v),
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 25.h,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(height: 30.v),
                  Text(
                    '1) 실온 보관법',
                    style: TextStyle(
                        fontSize: 20.h,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(height: 20.v),
                  Container(
                    width: 340.h,
                    height: 300.v,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(ImageConstant.imglifeHackOnion1)),
                    ),
                  ),
                  SizedBox(height: 20.v),
                  Text(
                    '① 박스에 신문지를 깔고 그 위에 양파를 담아 주세요.\n(tip.신문지가 수분을 흡수해 양파가 썩는 것을 방지해 줘요.)',
                    style: TextStyle(fontSize: 15.h, color: Colors.black),
                  ),
                  SizedBox(height: 20.v),
                  Text(
                    '2)냉장 보관법',
                    style: TextStyle(
                        fontSize: 20.h,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(height: 20.v),
                  Container(
                    width: 340.h,
                    height: 300.v,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image:
                                AssetImage(ImageConstant.imglifeHackOnion2))),
                  ),
                  SizedBox(height: 20.v),
                  Text(
                    '① 양파의 껍질을 제거 한 뒤 물로 씻어 주세요.\n② 키친타올로 수분을 닦은 후 랩으로 싸주세요.\n(tip. 랩으로 감싸면 수분 증발을 막아주고 냉장고 냄새가 배는 것을 방지해 줘요.)',
                    style: TextStyle(fontSize: 15.h, color: Colors.black),
                  ),
                  SizedBox(height: 20.v),
                  Text(
                    '3) 냉동 보관법',
                    style: TextStyle(
                        fontSize: 20.h,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(height: 20.v),
                  Container(
                    width: 340.h,
                    height: 300.v,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image:
                                AssetImage(ImageConstant.imglifeHackOnion3))),
                  ),
                  SizedBox(height: 20.v),
                  Text(
                    '① 양파를 원하는 모양으로 썰어 주세요.\n② 밀폐용기에 담아 냉동 보관해 주세요.\n(tip. 냉동 후에는 손질이 어려워 용도에 맞게 손질 후 소분해서 냉동 하는것을 추천해요.)\n(tip. 냉동 시 식감과 향이 떨어지므로 가능한 한 빨리 사용하는 것을 권장 드려요.)',
                    style: TextStyle(fontSize: 15.h, color: Colors.black),
                  ),
                  SizedBox(height: 20.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
