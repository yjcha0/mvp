import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

// ignore: must_be_immutable
class DonutChartWidget extends StatefulWidget {
  List<ChartData> chartDataList;
  final String totalAmountSpent;

  DonutChartWidget(this.chartDataList, this.totalAmountSpent, {super.key});
  @override
  State<DonutChartWidget> createState() => _DonutChartWidgetState();
}

class _DonutChartWidgetState extends State<DonutChartWidget> {
  late Timer timer;
  double fullAngle = 0.0;
  double secondsToComplete = 5;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 1000 ~/ 60), (timer) {
      setState(() {
        fullAngle += 360.0 / (secondsToComplete * 1000 ~/ 60);
        if (fullAngle >= 360.0) {
          fullAngle = 360.0;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.h),
      child: CustomPaint(
        painter: DonutChartPainter(
            widget.chartDataList, widget.totalAmountSpent, fullAngle),
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  final List<ChartData> chartDataList;
  final String totalAmountSpent;
  final double fullAngle;
  DonutChartPainter(this.chartDataList, this.totalAmountSpent, this.fullAngle);

  final linePaint = Paint()
    ..color = Colors.white
    ..strokeWidth = 5.0
    ..style = PaintingStyle.stroke;

  final midPaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  final labelBackgroundPaint = Paint()
    ..color = Colors.white.withOpacity(0.7)
    ..style = PaintingStyle.fill;

  final textFieldTextBigStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 25.0.h,
  );

  final textFieldTextBigStyleGrey = TextStyle(
    color: Colors.grey[700],
    fontSize: 20.0.h,
  );

  final labelStyle = TextStyle(
    color: Colors.black,
    fontSize: 20.0.h,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2.0, size.width / 2.0);
    double outerRadius = size.width * 0.5;
    final rect =
        Rect.fromCenter(center: center, width: size.width, height: size.width);

    var startAngle = 0.0;
    canvas.drawArc(rect, startAngle, fullAngle * pi / 180.0, false, linePaint);

    startAngle = 0.0;
    for (var element in chartDataList) {
      final sweepAngle = element.value / 100.0 * fullAngle * pi / 180.0;
      drawSector(element, canvas, rect, startAngle, sweepAngle);
      startAngle += sweepAngle;
    }

    startAngle = 0.0;
    for (var element in chartDataList) {
      final sweepAngle = element.value / 100.0 * fullAngle * pi / 180.0;
      drawLine(outerRadius, startAngle, center, canvas);
      startAngle += sweepAngle;
    }

    startAngle = 0.0;
    for (var element in chartDataList) {
      final sweepAngle = element.value / 100.0 * fullAngle * pi / 180.0;
      drawLabel(canvas, center, outerRadius, startAngle, sweepAngle,
          element.category);
      startAngle += sweepAngle;
    }

    canvas.drawCircle(center, outerRadius * 0.5, midPaint);

    drawMidTextCentered(
      canvas,
      center,
      totalAmountSpent,
      textFieldTextBigStyleGrey,
      textFieldTextBigStyle,
      outerRadius * 0.9,
    );
  }

  TextPainter measureText(
      String s, TextStyle style, double maxWidth, TextAlign align) {
    final span = TextSpan(text: s, style: style);
    final tp = TextPainter(
        text: span, textAlign: align, textDirection: TextDirection.ltr);
    tp.layout(minWidth: 0, maxWidth: maxWidth);

    return tp;
  }

  void drawMidTextCentered(
      Canvas canvas,
      Offset position,
      String totalAmountSpent,
      TextStyle titleStyle,
      TextStyle totalSpentStyle,
      double maxWidth) {
    final double fontSize = 15.h;
    final title =
        measureText('총 지출 금액', titleStyle, maxWidth, TextAlign.center);
    final posTitle = position +
        Offset(-title.width / 2.0, -title.height / 2.0 - fontSize * 1.5);
    final totalSpent = measureText(
        totalAmountSpent, totalSpentStyle, maxWidth, TextAlign.center);
    final posTotalSpent = position +
        Offset(
            -totalSpent.width / 2.0, -totalSpent.height / 2.0 + fontSize * 0.5);

    final ontap = measureText(
      '탭하여 자세히 보기',
      TextStyle(
        color: Colors.grey.withOpacity(0.8),
        fontSize: 14.h,
        fontWeight: FontWeight.bold,
      ),
      maxWidth,
      TextAlign.center,
    );
    final posOnTap = position +
        Offset(
            -totalSpent.width / 2.0, -totalSpent.height / 2.0 + fontSize * 2.8);

    title.paint(canvas, posTitle);
    totalSpent.paint(canvas, posTotalSpent);
    ontap.paint(canvas, posOnTap);
  }

  void drawTextCentered(Canvas canvas, Offset position, String text,
      TextStyle style, double maxWidth, Function(Size size) backgroundRect) {
    final tp = measureText(text, style, maxWidth, TextAlign.center);
    final pos = position + Offset(-tp.width / 2.0, -tp.height / 2.0);

    backgroundRect(tp.size);
    tp.paint(canvas, pos);
  }

  void drawLine(
      double outerRadius, double startAngle, Offset center, Canvas canvas) {
    final dx = outerRadius * cos(startAngle);
    final dy = outerRadius * sin(startAngle);
    final p2 = center + Offset(dx, dy);

    canvas.drawLine(center, p2, linePaint);
  }

  void drawSector(ChartData element, Canvas canvas, Rect rect,
      double startAngle, double sweepAngle) {
    final paint = Paint()
      // ..strokeWidth = 100.h
      // ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill
      ..color = element.color;

    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle,
      true,
      paint,
    );
  }

  void drawLabel(Canvas canvas, Offset center, double outerRadius,
      double startAngle, double sweepAngle, String category) {
    final r = outerRadius * 0.75;
    final dx = r * cos(startAngle + sweepAngle / 2.0);
    final dy = r * sin(startAngle + sweepAngle / 2.0);
    final position = center + Offset(dx, dy);

    drawTextCentered(canvas, position, category, labelStyle, 100.0,
        (Size size) {
      final rect = Rect.fromCenter(
        center: position,
        width: size.width + 10.h,
        height: size.height + 10.h,
      );
      final rrect = RRect.fromRectAndRadius(rect, Radius.circular(20.h));
      canvas.drawRRect(rrect, labelBackgroundPaint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
