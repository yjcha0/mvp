import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RecipeCategoryText extends StatelessWidget {
  RecipeCategoryText(this.string,
      {super.key, this.fontsize, this.fontweight, this.fontcolor});

  late final String? string;
  double? fontsize;
  FontWeight? fontweight;
  Color? fontcolor;

  @override
  Widget build(BuildContext context) {
    return Text(
      string ?? "",
      style: TextStyle(
        fontSize: fontsize ?? 14,
        color: fontcolor ?? Colors.grey.shade600,
        fontWeight: fontweight ?? FontWeight.w600,
      ),
    );
  }
}
