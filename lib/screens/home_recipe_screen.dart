import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:mvp/screens/recipe_screen.dart';

// ignore_for_file: must_be_immutable
class HomeRecipeScreen extends StatefulWidget {
  const HomeRecipeScreen({Key? key}) : super(key: key);

  @override
  State<HomeRecipeScreen> createState() => _HomeRecipeScreenState();
}

class _HomeRecipeScreenState extends State<HomeRecipeScreen> {
  final String appBarTitle = "    오늘 저녁은\n    뭘 만들어 먹을까?";

  late PageController _pageController;
  final int _currentPage = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: CustomAppBar(
          height: 120.v,
          titleAlign: Alignment.centerLeft,
          title: appBarTitle,
          actions: [
            Container(
              padding: EdgeInsets.only(right: 21.h, top: 30.v),
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
          ],
        ),
        endDrawer: const ProfileDrawer(),
        body: SizedBox(
          height: mediaQueryData.size.height,
          width: mediaQueryData.size.width,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RecipeCategoryText('추천요리'),
                    RecipeCategoryText('간단요리'),
                    RecipeCategoryText(
                      '인기요리',
                      fontcolor: Colors.black,
                      fontsize: 16,
                    ),
                    RecipeCategoryText('맞춤요리'),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              HorizontalSlider(
                recipeImgList,
                recipeTitleList,
                duration: 6,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      createLeftRightRouteTo(const RecipeListScreen()));
                },
                child: Container(
                  height: 110.v,
                  // width: 250.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "오늘은 어떤 요리를 해볼까요?",
                        style: theme.textTheme.headlineMedium,
                      ),
                      SizedBox(height: 10.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "더 많은 레시피 보러가기",
                            style: CustomTextStyles.bodyLargeGray60018,
                          ),
                          SizedBox(width: 5.h),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 25.adaptSize,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            createLeftRightRouteTo(
                              const RecipeScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "만들어먹기",
                          style: CustomTextStyles.bodyLargeGray60018,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      createBottomTopRouteTo(HomeOrderScreen()));
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 10.v),
                  height: 80.v,
                  width: double.infinity,
                  decoration:
                      AppDecoration.gradientBlueToOnPrimaryContainer.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 5.v),
                      Container(
                        width: 60.h,
                        alignment: Alignment.center,
                        child: Divider(
                          thickness: 3,
                          height: 1,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Text(
                        "재료 주문하기",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      createBottomTopRouteTo(HomeFridgeScreen()));
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 10.v),
                  height: 80.v,
                  width: double.infinity,
                  decoration:
                      AppDecoration.gradientBlueToOnPrimaryContainer.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 5.v),
                      Container(
                        width: 60.h,
                        alignment: Alignment.center,
                        child: Divider(
                          thickness: 3,
                          height: 1,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Text(
                        "냉장고 확인하기",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
