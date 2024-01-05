import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({Key? key})
      : super(
          key: key,
        );

  static const String myFridgeTitle = '인기요리';

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  static const List<String> foodCategories = [
    '양식',
    '한식',
    '중식',
    '일식',
    '분식',
    '야식',
    '도시락'
  ];
  String clickedFoodCategories = '한식';
  int clickedItemIndex = 0;

  RecipePreview recipePreview = RecipePreview(
      recipeImagePath: recipeListImgList[0],
      recipeTitle: recipeListTitleList[0],
      recipeContext: recipeListContextList[0],
      servings: Random().nextInt(6),
      cookTime: Random().nextInt(12) * 5,
      difficulty: Random().nextInt(3));

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
                RecipeListScreen.myFridgeTitle,
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
                    AppbarImage(svgPath: ImageConstant.imgViewfilterleft),
                    SizedBox(width: 15.h),
                    AppbarImage(svgPath: ImageConstant.imgViewfirterright),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          child: Column(
            children: <Widget>[
              SizedBox(
                width: mediaQueryData.size.width,
                height: 50.v,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodCategories.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          clickedFoodCategories = foodCategories[index];
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 10.v),
                        // height: 50.v,
                        // width: 50.h,
                        child: Text(
                          foodCategories[index],
                          style: TextStyle(
                            fontSize: 20.v,
                            fontWeight:
                                clickedFoodCategories == foodCategories[index]
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                            color:
                                clickedFoodCategories == foodCategories[index]
                                    ? Colors.black
                                    : Colors.grey,
                            decoration:
                                clickedFoodCategories == foodCategories[index]
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                            decorationColor: Colors.amber[300],
                            decorationThickness: 2.v,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20.v),
              Expanded(
                child: SizedBox(
                  width: mediaQueryData.size.width,
                  child: Row(
                    children: [
                      SizedBox(width: 15.h),
                      SizedBox(
                        width: 120.h,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: recipeListImgList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  clickedItemIndex = index;
                                  recipePreview = RecipePreview(
                                      recipeImagePath: recipeListImgList[index],
                                      recipeTitle: recipeListTitleList[index],
                                      recipeContext:
                                          recipeListContextList[index],
                                      servings: Random().nextInt(6) + 1,
                                      cookTime: Random().nextInt(12) * 5 + 10,
                                      difficulty: Random().nextInt(3));
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                alignment: Alignment.center,
                                height: 120.h,
                                width: 120.h,
                                decoration: BoxDecoration(
                                  color: clickedItemIndex == index
                                      ? Colors.blue[50]
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20.h),
                                ),
                                // padding: EdgeInsets.all(20.h),
                                child: Container(
                                  height: 100.h,
                                  width: 100.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            recipeListImgList[index]),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 20.h),
                      recipePreview,
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
