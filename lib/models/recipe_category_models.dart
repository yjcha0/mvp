import 'package:mvp/core/app_export.dart';
import 'package:collection/collection.dart';

final List<String> foodCategoryImgList = [
  ImageConstant.imgImage4539x42,
  ImageConstant.imgImage4642x42,
  ImageConstant.imgImage4742x42,
  ImageConstant.imgImage4842x42,
  ImageConstant.imgImage4942x42,
  ImageConstant.imgImage5042x42,
  ImageConstant.imgImage57,
  ImageConstant.imgImage52,
  ImageConstant.imgImage53,
  ImageConstant.imgImage54,
  ImageConstant.imgImage55,
  ImageConstant.imgImage56,
];

final List<String> foodCategoryTitleList = [
  "족발/보쌈",
  "돈까스/회",
  "고기/구이",
  "피자",
  "찜/찌개",
  "양식",
  "중식",
  "아시안",
  "치킨",
  "백반/죽",
  "버거",
  "분식",
];

final List<Map<String, String>> foodCategories = [
  for (var info in IterableZip([foodCategoryImgList, foodCategoryTitleList]))
    {'image': info[0], 'category': info[1]}
];
