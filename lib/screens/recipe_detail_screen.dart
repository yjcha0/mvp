import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class RecipeDetailScreen extends StatefulWidget {
  final String recipeImgPath;
  final String recipeTitle;
  const RecipeDetailScreen(
      {super.key, required this.recipeImgPath, required this.recipeTitle});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  int servings = 1;

  List<String> measurement = ['종이컵', '계량컵', '스푼'];
  int measurementIdx = 0;

  TextStyle nutritionStyle = TextStyle(
      color: Colors.black, fontSize: 15.h, fontWeight: FontWeight.w400);

  var a = recipeImgList;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      color: Colors.grey,
      width: mediaQueryData.size.width,
      height: mediaQueryData.size.height,
      child: Column(children: [
        //TitleImg
        Container(
          width: mediaQueryData.size.width,
          height: 300.v,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.recipeImgPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 21.h),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.h))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Container(
                width: mediaQueryData.size.width,
                padding: EdgeInsets.symmetric(vertical: 10.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.recipeTitle,
                      style: TextStyle(
                          fontSize: 21.h,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10.v),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'by UncleRoger',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 17.h,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Icon(Icons.star, size: 25.h, color: Colors.amber),
                        Text(
                          ' 4.4/5.0(229)',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.h,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.v),
              //cook, measurement
              SizedBox(
                width: mediaQueryData.size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5.v),
                            width: 90.h,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.v),
                              borderRadius: BorderRadius.circular(20.h),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (servings > 1) {
                                        servings--;
                                      } else {
                                        servings = 1;
                                      }
                                    });
                                  },
                                  child: Icon(Icons.remove_rounded,
                                      size: 20.adaptSize, color: Colors.black),
                                ),
                                Text('$servings',
                                    style: TextStyle(
                                        fontSize: 20.adaptSize,
                                        color: Colors.black)),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      servings++;
                                    });
                                  },
                                  child: Icon(Icons.add_rounded,
                                      size: 20.adaptSize, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Text(' 인분 조리',
                              style: TextStyle(
                                  fontSize: 24.adaptSize,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                        ]),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (measurementIdx == measurement.length - 1) {
                                measurementIdx = 0;
                              } else {
                                measurementIdx++;
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 90.h,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.v),
                              borderRadius: BorderRadius.circular(20.h),
                            ),
                            child: Text(measurement[measurementIdx],
                                style: TextStyle(
                                    fontSize: 20.adaptSize,
                                    color: Colors.black)),
                          ),
                        ),
                        Text(' 계량',
                            style: TextStyle(
                                fontSize: 24.adaptSize,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.v),
              //Nutrition
              Text(
                'Nutritions 영양성분',
                style: TextStyle(
                    fontSize: 25.h,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(height: 10.v),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40.h, vertical: 10.v),
                width: mediaQueryData.size.width,
                decoration: BoxDecoration(
                  color: Colors.blue[50]!.withOpacity(0.7),
                  border: Border.all(color: Colors.blue[200]!, width: 2.v),
                  borderRadius: BorderRadius.circular(10.h),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Calories', style: nutritionStyle),
                        Text('Fat', style: nutritionStyle),
                        Text('Carb', style: nutritionStyle),
                        Text('Sugar', style: nutritionStyle),
                        Text('Fiber', style: nutritionStyle),
                        Text('Protein', style: nutritionStyle),
                        Text('Sodium', style: nutritionStyle),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('칼로리', style: nutritionStyle),
                        Text('지방', style: nutritionStyle),
                        Text('탄수화물', style: nutritionStyle),
                        Text('당류', style: nutritionStyle),
                        Text('식이섬유', style: nutritionStyle),
                        Text('단백질', style: nutritionStyle),
                        Text('나트륨', style: nutritionStyle),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('332kcal', style: nutritionStyle),
                        Text('40(g)', style: nutritionStyle),
                        Text('55(g)', style: nutritionStyle),
                        Text('20(g)', style: nutritionStyle),
                        Text('35(g)', style: nutritionStyle),
                        Text('62(g)', style: nutritionStyle),
                        Text('10(g)', style: nutritionStyle),
                      ],
                    ),
                  ],
                ),
              ),
              //Ingredients
              Text(
                'Ingredients 재료',
                style: TextStyle(
                    fontSize: 25.h,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              //Recipe
              Text(
                'Recipe 레시피',
                style: TextStyle(
                    fontSize: 25.h,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              //Reviews
              Text(
                'Reviews 리뷰',
                style: TextStyle(
                    fontSize: 25.h,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
