import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.height,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
    this.titleAlign,
  }) : super(
          key: key,
        );

  final double? height;

  final double? leadingWidth;

  final Widget? leading;

  final String? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  final Alignment? titleAlign;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 56.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: Align(
        alignment: titleAlign ?? Alignment.center,
        child: Text(
          title ?? "",
          style: TextStyle(
            fontSize: 25.adaptSize,
            fontWeight: FontWeight.bold,
            color: appTheme.black900,
          ),
        ),
      ),
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        mediaQueryData.size.width,
        height ?? 56.v,
      );
}
