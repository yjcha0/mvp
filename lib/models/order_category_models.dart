import 'package:mvp/core/app_export.dart';
import 'package:collection/collection.dart';

final List<String> categoryImgList = [
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

final List<String> categoryTitleList = [
  "채소",
  "육류",
  "유재품",
  "계란",
  "물/음료",
  "빵",
  "라면",
  "소스/조미료",
  "과자",
  "청소용품",
  "아이스크림",
  "냉동식품",
];

final List<Map<String, String>> categories = [
  for (var info in IterableZip([categoryImgList, categoryTitleList]))
    {'image': info[0], 'category': info[1]}
];
