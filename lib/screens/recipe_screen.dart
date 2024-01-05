import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/widgets/category_appbar.dart';
import 'package:mvp/widgets/order_category_icon.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  static const String RecipeScreenTitle = '만들어 먹기';

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool showFilter = false;
  bool showCategory = false;

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
                RecipeScreen.RecipeScreenTitle,
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 10.h,
            ),
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
                Padding(
                  padding: EdgeInsets.only(
                    top: 30.h,
                    bottom: 10.h,
                  ),
                  child: showCategory
                      ? GridView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 10,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {},
                            child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 70.adaptSize,
                                      height: 70.adaptSize,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color(0xFFB6D9ED),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 17,
                                    ),
                                    child: Text(
                                      "한식",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : GridView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {},
                            child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 70.adaptSize,
                                      height: 70.adaptSize,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color(0xFFB6D9ED),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 17,
                                    ),
                                    child: Text(
                                      "한식",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showCategory = !showCategory;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 25.v),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "카테고리 전체 보기",
                          style: TextStyle(
                            fontSize: 15.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CategoryAppbar(
                  text: "있는 재료로 만들어 먹어요",
                  onPressed: () {},
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 185.h,
                          height: 185.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.h,
                          vertical: 5.h,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "김치볶음밥",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.h,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: Image(
                                    image:
                                        AssetImage(ImageConstant.imgImage105),
                                  ),
                                ),
                                Text(
                                  " 4.4/5.0 (229)",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.h,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CategoryAppbar(
                  text: "몇가지만 더 구매하면 요리 가능",
                  onPressed: () {},
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 185.h,
                          height: 185.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.h,
                          vertical: 5.h,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "김치볶음밥",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.h,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: Image(
                                    image:
                                        AssetImage(ImageConstant.imgImage105),
                                  ),
                                ),
                                Text(
                                  " 4.4/5.0 (229)",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.h,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CategoryAppbar(
                  text: "인기 레시피",
                  onPressed: () {
                    Navigator.push(
                      context,
                      createLeftRightRouteTo(
                        const RecipeListScreen(),
                      ),
                    );
                  },
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 185.h,
                          height: 185.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.h,
                          vertical: 5.h,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "김치볶음밥",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.h,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: Image(
                                    image:
                                        AssetImage(ImageConstant.imgImage105),
                                  ),
                                ),
                                Text(
                                  " 4.4/5.0 (229)",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.h,
                                  ),
                                )
                              ],
                            ),
                          ],
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
    );
  }
}
