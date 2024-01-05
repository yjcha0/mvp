import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class RecipePreview extends StatelessWidget {
  final String recipeImagePath;
  final String recipeTitle;
  final String recipeContext;
  final int servings;
  final int cookTime;
  final int difficulty;
  RecipePreview(
      {super.key,
      required this.recipeImagePath,
      required this.recipeTitle,
      required this.recipeContext,
      required this.servings,
      required this.cookTime,
      required this.difficulty});

  final a = recipeImgList[0];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: ClipRect(
              clipBehavior: Clip.hardEdge,
              child: Transform.translate(
                offset: Offset(25.h, 0),
                child: Container(
                  width: 310.h,
                  height: 310.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(recipeImagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 20.v),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(15.h)),
                    color: Colors.grey[50]!.withOpacity(0.7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipeTitle,
                      style: TextStyle(
                          fontSize: 18.h,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10.v),
                    Text(
                      recipeContext,
                      style: TextStyle(
                          fontSize: 15.h,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700]),
                    ),
                    SizedBox(height: 10.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.people, size: 30.adaptSize),
                            Text(
                              '$servings인분',
                              style: TextStyle(
                                  fontSize: 15.h,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[700]),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.access_time_rounded, size: 30.adaptSize),
                            Text(
                              '$cookTime분',
                              style: TextStyle(
                                  fontSize: 15.h,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[700]),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                                difficulty == 2
                                    ? Icons.star
                                    : difficulty == 1
                                        ? Icons.star_half
                                        : Icons.star_border,
                                size: 30.adaptSize),
                            Text(
                              difficulty == 2
                                  ? '어려움'
                                  : difficulty == 1
                                      ? '보통'
                                      : '쉬움',
                              style: TextStyle(
                                  fontSize: 15.h,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[700]),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      createLeftRightRouteTo(RecipeDetailScreen(
                        recipeImgPath: recipeImagePath,
                        recipeTitle: recipeTitle,
                      )));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70.v,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(15.h)),
                    color: Colors.blue[100],
                  ),
                  child: Text(
                    '레시피 보러가기',
                    style: TextStyle(
                      fontSize: 20.h,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.v),
            ],
          ),
        ],
      ),
    );
  }
}
