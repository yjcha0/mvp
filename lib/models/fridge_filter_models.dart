import 'package:mvp/core/app_export.dart';
import 'package:collection/collection.dart';

final List<String> fridgeFilterList = [
  '음료 커피 생수',
  '쌀 잡곡 견과',
  '정육 수산 계란',
  '우유 유제품',
  '과일 채소',
  '햄 어묵 통조림',
  '양념 장류 오일',
  '빵 떡 잼',
];

final List<Map<String, String>> fridgeFilter = [
  for (var info in IterableZip([fridgeFilterList])) {'title': info[0]}
];
