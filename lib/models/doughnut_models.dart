import 'package:flutter/material.dart';

class ChartData {
  final String category;
  final double value;
  final Color color;
  final double money;

  ChartData({
    required this.category,
    required this.value,
    required this.money,
    required this.color,
  });
}

final List<ChartData> chartDataList = [
  ChartData(category: '육류', value: 40, money: 121040, color: Colors.amber),
  ChartData(category: '채소류', value: 15, money: 45390, color: Colors.red),
  ChartData(category: '기타', value: 20, money: 60520, color: Colors.green),
  ChartData(category: '유제품', value: 15, money: 45390, color: Colors.blue),
  ChartData(category: '음료', value: 10, money: 30260, color: Colors.purple),
];

double totalMoneySpent(List<ChartData> chartDataList) {
  double totalMoney = 0.0;
  for (var element in chartDataList) {
    totalMoney += element.money;
  }

  return totalMoney;
}
