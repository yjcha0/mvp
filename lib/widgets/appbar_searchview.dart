import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

// ignore: must_be_immutable
class AppbarSearchview extends StatelessWidget {
  AppbarSearchview({
    Key? key,
    this.hintText,
    this.controller,
    this.padding,
    this.width,
  }) : super(
          key: key,
        );

  String? hintText;

  TextEditingController? controller;

  EdgeInsetsGeometry? padding;

  double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: CustomSearchView(
        width: width,
        controller: controller,
        hintText: hintText,
        suffix: Padding(
          padding: EdgeInsets.only(
            right: 0.h,
          ),
          child: IconButton(
            onPressed: () {
              controller!.clear();
            },
            icon: Icon(
              Icons.clear,
              color: Colors.grey.shade600,
            ),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 0.h, vertical: 0.v),
        borderDecoration: SearchViewStyleHelper.outlineBlack,
        filled: true,
        fillColor: theme.colorScheme.secondaryContainer,
      ),
    );
  }
}
