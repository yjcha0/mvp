import 'package:collection/collection.dart';
import 'package:mvp/core/app_export.dart';

final List<String> garlicImgList = [
  ImageConstant.garlic,
  ImageConstant.garlic,
  ImageConstant.garlic,
  ImageConstant.garlic,
  ImageConstant.garlic,
  ImageConstant.garlic,
  ImageConstant.garlic,
  ImageConstant.garlic,
];

final List<String> garlicPriceList = [
  '2,700원',
  '1,900원',
  '3,100원',
  '2,550원',
  '2,600원',
  '2,700원',
  '1,900원',
  '3,100원',
  '2,700원',
  '1,900원',
];

final List<String> garlicTitleList = [
  '마늘 A',
  '마늘 B',
  '마늘 C',
  '마늘 D',
  '마늘 E',
  '마늘 F',
  '마늘 G',
  '마늘 H',
  '마늘 I',
  '마늘 J',
];

final List<Map<String, String>> garlicModel = [
  for (var info
      in IterableZip([garlicImgList, garlicPriceList, garlicTitleList]))
    {'image': info[0], 'price': info[1], 'title': info[2]}
];
