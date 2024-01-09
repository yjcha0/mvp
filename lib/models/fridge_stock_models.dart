import 'package:mvp/core/app_export.dart';
import 'package:collection/collection.dart';

final List<String> fridgeStockImgList = [
  ImageConstant.imgEllipse11,
  ImageConstant.imgEllipse12,
  ImageConstant.imgEllipse13,
  ImageConstant.imgEllipse1380x80,
  ImageConstant.imgEllipse35,
  ImageConstant.imgEllipse36,
  ImageConstant.imgEllipse11,
  ImageConstant.imgEllipse41,
];

final List<String> fridgeStockTitleList = [
  '양파 한망 묶음 (4개)',
  '닭가슴살',
  '분말 카레',
  '천일염',
  '무염버터',
  '카카오 파우더',
  '마늘 한 접',
  '상추',
];

final List<String> fridgeStockDateList = [
  '2023년 11월 02일',
  '2023년 11월 02일',
  '2023년 11월 02일',
  '2023년 11월 02일',
  '2023년 11월 02일',
  '2023년 11월 02일',
  '2023년 11월 02일',
  '2023년 11월 02일',
];

final List<int> fridgeStockExpirationList = [
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
];

final List<String> fridgeStockTipList = [
  '구입일로부터 2주일 동안이 가장 신선해요',
  '구입일로부터 한 달 동안이 가장 신선해요',
  '구입일로부터 반 년 동안이 가장 신선해요',
  '구입일로부터 2년 동안이 가장 신선해요',
  '구입일로부터 2개월 동안이 가장 신선해요',
  '구입일로부터 3개월 동안이 가장 신선해요',
  '구입일로부터 3주일 동안이 가장 신선해요',
  '구입일로부터 2일 동안이 가장 신선해요',
];

final List<int> fridgeStockTotalAmountList = [
  400,
  1000,
  800,
  1890,
  400,
  40,
  250,
  200,
];

final List<int> fridgeStockRemainAmountList = [
  300,
  230,
  330,
  990,
  240,
  30,
  40,
  20,
];

final List<Map> fridgeStock = [
  for (var info in IterableZip([
    fridgeStockImgList,
    fridgeStockTitleList,
    fridgeStockDateList,
    fridgeStockExpirationList,
    fridgeStockTipList,
    fridgeStockTotalAmountList,
    fridgeStockRemainAmountList,
  ]))
    {
      'image': info[0],
      'title': info[1],
      'date': info[2],
      'expiration': info[3],
      'tip': info[4],
      'totalAmount': info[5],
      'amount': info[6],
    }
];
