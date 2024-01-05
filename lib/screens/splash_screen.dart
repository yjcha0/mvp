import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeFridgeScreen())));

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgSplash,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 37.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30.v),
                Container(
                  decoration: const BoxDecoration(),
                  child: Text(
                    "손 안 의 냉 장 고",
                    style: theme.textTheme.displayMedium,
                  ),
                ),
                SizedBox(height: 30.v),
                Container(
                  decoration: const BoxDecoration(),
                  child: Text(
                    "주 문 부 터 요 리 까 지",
                    style: CustomTextStyles.headlineSmallExo2OnPrimaryContainer,
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
