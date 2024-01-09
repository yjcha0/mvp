import 'package:mvp/core/app_export.dart';
import 'package:collection/collection.dart';

final List<String> fridgeCategoryImgList = [
  ImageConstant.imgImage4539x42,
  ImageConstant.imgImage4642x42,
  ImageConstant.imgImage4742x42,
  ImageConstant.imgImage4539x42,
  ImageConstant.imgImage4642x42,
  ImageConstant.imgImage4742x42,
  ImageConstant.imgImage4539x42,
  ImageConstant.imgImage4642x42,
  ImageConstant.imgImage4742x42,
  ImageConstant.imgImage4539x42,
  ImageConstant.imgImage4642x42,
  ImageConstant.imgImage4742x42,
  ImageConstant.imgImage4539x42,
];

final List<String> fridgeCategoryTitleList = [
  "채소",
  "육류",
  "유재품",
  "채소",
  "육류",
  "유재품",
  "채소",
  "육류",
  "유재품",
  "채소",
  "육류",
  "유재품",
  "채소",
];

final List<Map<String, String>> FridgeCategories = [
  for (var info
      in IterableZip([fridgeCategoryImgList, fridgeCategoryTitleList]))
    {'image': info[0], 'category': info[1]}
];
