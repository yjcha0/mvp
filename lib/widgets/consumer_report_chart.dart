// import 'package:fl_chart_app/presentation/resources/app_resources.dart';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:mvp/core/app_export.dart';

class ConsumerReportChartWidget extends StatefulWidget {
  const ConsumerReportChartWidget({super.key});

  @override
  State<ConsumerReportChartWidget> createState() =>
      _ConsumerReportChartWidgetState();
}

class _ConsumerReportChartWidgetState extends State<ConsumerReportChartWidget> {
  final pilateColor = Colors.amber[300];

  final cyclingColor = Colors.green[300];

  final quickWorkoutColor = Colors.blue[300];

  final betweenSpace = 0.2.v;

  final double divider = 5000;

  double maxValue = 0;

  List<BarChartGroupData> generateBarGroupFromData(
      List<Map<String, double>> barGroupData) {
    List<BarChartGroupData> barGroups = [];
    for (var data in barGroupData) {
      barGroups.add(generateGroupData(data['day']!.toInt(), data['firstData']!,
          data['secondData']!, data['thirdData']!));
    }
    return barGroups;
  }

  BarChartGroupData generateGroupData(
    int x,
    double firstData,
    double secondData,
    double thirdData,
  ) {
    double pilatesMappedValue = firstData / divider;
    double quickWorkoutMappedValue = secondData / divider;
    double cyclingMappedValue = thirdData / divider;
    double barWidth = 30.h;

    double currMaxValue = firstData + secondData + thirdData + 3 * betweenSpace;
    if (maxValue < currMaxValue) {
      maxValue = currMaxValue;
    }
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          borderRadius: BorderRadius.zero,
          fromY: 0,
          toY: pilatesMappedValue,
          color: Colors.amber[300],
          width: barWidth,
        ),
        BarChartRodData(
          borderRadius: BorderRadius.zero,
          fromY: pilatesMappedValue + betweenSpace,
          toY: pilatesMappedValue + betweenSpace + quickWorkoutMappedValue,
          color: Colors.green[300],
          width: barWidth,
        ),
        BarChartRodData(
          borderRadius: BorderRadius.zero,
          fromY: pilatesMappedValue +
              betweenSpace +
              quickWorkoutMappedValue +
              betweenSpace,
          toY: pilatesMappedValue +
              betweenSpace +
              quickWorkoutMappedValue +
              betweenSpace +
              cyclingMappedValue,
          color: Colors.blue[300],
          width: barWidth,
        ),
      ],
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
    int q1 = maxValue * 0 ~/ divider;
    int q2 = maxValue * 0.25 ~/ divider;
    int q3 = maxValue * 0.5 ~/ divider;
    int q4 = maxValue * 0.75 ~/ divider;
    int q5 = maxValue * 1 ~/ divider;

    if (value.toInt() == q1) {
      text = '${maxValue ~/ 1000 / 10 * 0}만';
    } else if (value.toInt() == q2) {
      text = '${maxValue ~/ 1000 / 10 * 0.25}만';
    } else if (value.toInt() == q3) {
      text = '${maxValue ~/ 1000 / 10 * 0.5}만';
    } else if (value.toInt() == q4) {
      text = '${maxValue ~/ 1000 / 10 * 0.75}만';
    } else if (value.toInt() == q5) {
      text = '${maxValue ~/ 1000 / 10 * 1}만';
    } else {
      text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    TextStyle style = TextStyle(fontSize: 15.h, fontWeight: FontWeight.bold);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'SUN';
        break;
      case 1:
        text = 'MON';
        break;
      case 2:
        text = 'TUE';
        break;
      case 3:
        text = 'WED';
        break;
      case 4:
        text = 'THU';
        break;
      case 5:
        text = 'FRI';
        break;
      case 6:
        text = 'SAT';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    var barGroups = generateBarGroupFromData(barGroupData);

    return Padding(
      padding: EdgeInsets.all(21.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DateFormat("yyyy년 MM월의 넷째 주 소비 리포트!").format(DateTime.now()),
            style: TextStyle(
              color: AppColors.contentColorBlue,
              fontSize: 20.h,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.v),
          LegendsListWidget(
            legends: [
              Legend('BREAKFAST', pilateColor!),
              Legend('LUNCH', cyclingColor!),
              Legend('DINNER', quickWorkoutColor!),
            ],
          ),
          const SizedBox(height: 14),
          AspectRatio(
            aspectRatio: 1.2,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceBetween,
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(),
                  // leftTitles: AxisTitles(
                  //   sideTitles: SideTitles(
                  //     showTitles: true,
                  //     reservedSize: 28,
                  //     interval: 1,
                  //     getTitlesWidget: leftTitles,
                  //   ),
                  // ),
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: bottomTitles,
                      reservedSize: 20,
                    ),
                  ),
                ),
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      double toolTipValue = (barGroups[groupIndex]
                                  .barRods[rodIndex]
                                  .toY -
                              barGroups[groupIndex].barRods[rodIndex].fromY) *
                          divider;

                      return BarTooltipItem(
                        NumberFormat.currency(locale: 'ko_KR', symbol: '₩')
                            .format(toolTipValue),
                        TextStyle(
                          fontSize: 20.h,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                barGroups: barGroups,
                maxY: maxValue * 1.0 / divider + (betweenSpace * 4),
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(
                      y: maxValue * 1.0 / divider,
                      color: Colors.amber[200]!.withOpacity(0.5),
                      strokeWidth: 3,
                      dashArray: [15, 10],
                    ),
                    HorizontalLine(
                      y: maxValue * 0.75 / divider,
                      color: Colors.green[200]!.withOpacity(0.5),
                      strokeWidth: 3,
                      dashArray: [15, 10],
                    ),
                    HorizontalLine(
                      y: maxValue * 0.5 / divider,
                      color: Colors.blue[200]!.withOpacity(0.5),
                      strokeWidth: 3,
                      dashArray: [15, 10],
                    ),
                    HorizontalLine(
                      y: maxValue * 0.25 / divider,
                      color: Colors.purple[200]!.withOpacity(0.5),
                      strokeWidth: 3,
                      dashArray: [15, 10],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
