import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class SinglePostHeader extends StatelessWidget {
  final String backgroundImagePath;
  final String writter;
  SinglePostHeader({
    super.key,
    required this.backgroundImagePath,
    required this.writter,
    this.liked,
    this.scrapped,
  });

  bool? liked = false;
  bool? scrapped = false;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 21.h),
      width: mediaQueryData.size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 320.v,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: mediaQueryData.size.width,
                  height: 260.v,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.h),
                    image: DecorationImage(
                      image: AssetImage(backgroundImagePath),
                      fit: BoxFit.cover,
                      opacity: 0.8,
                    ),
                  ),
                ),
                SizedBox(height: 40.v),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width: 20.h),
              Icon(
                Icons.account_circle_rounded,
                size: 70.adaptSize,
                color: Colors.black,
              ),
              SizedBox(width: 10.h),
              Text(
                writter,
                style: TextStyle(
                  fontSize: 25.h,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Icon(
                liked ?? false
                    ? Icons.favorite_rounded
                    : Icons.favorite_outline_rounded,
                size: 40.adaptSize,
                color: Colors.red[300],
              ),
              SizedBox(width: 20.v),
              Icon(
                scrapped ?? false
                    ? Icons.bookmark_rounded
                    : Icons.bookmark_add_outlined,
                size: 40.adaptSize,
                color: Colors.amber[300],
              ),
              SizedBox(width: 20.h),
            ],
          ),
        ],
      ),
    );
  }
}
