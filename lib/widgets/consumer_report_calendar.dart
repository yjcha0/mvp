import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:mvp/core/app_export.dart';

class ConsumerReportCalendarWidget extends StatefulWidget {
  const ConsumerReportCalendarWidget({super.key});

  @override
  State<ConsumerReportCalendarWidget> createState() =>
      _ConsumerReportCalendarWidgetState();
}

class _ConsumerReportCalendarWidgetState
    extends State<ConsumerReportCalendarWidget> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // ignore: unused_field
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _selectedEvents = ValueNotifier(_getEventsForDay(_focusedDay));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      if (_selectedDay == selectedDay) {
        _selectedDay = DateTime(selectedDay.year, selectedDay.month + 2, 0);
      } else {
        _selectedDay = selectedDay;
      }
      _focusedDay = focusedDay;
    });

    _selectedEvents.value = _getEventsForDay(_selectedDay!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar<Event>(
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, day, events) {
              final String strSpentMoney;
              if (events.isEmpty) {
                strSpentMoney = '';
              } else {
                double spentMoney = 0;
                for (var element in events) {
                  spentMoney += element.price;
                }
                var f = NumberFormat.currency(locale: 'ko_KR', symbol: '₩');
                strSpentMoney = f.format(spentMoney);
              }
              return Text(
                strSpentMoney,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.h,
                    fontWeight: FontWeight.bold),
              );
            },
          ),
          firstDay: DateTime(_focusedDay.year - 1, 1, 1),
          lastDay: DateTime(_focusedDay.year, _focusedDay.month + 1, 0),
          focusedDay: _focusedDay,
          eventLoader: _getEventsForDay,
          onDaySelected: _onDaySelected,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onCalendarCreated: (controller) => _pageController = controller,
          onPageChanged: (focusedDay) => _focusedDay = focusedDay,
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            leftChevronVisible: false,
            rightChevronVisible: false,
            titleCentered: true,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 30.h),
            titleTextFormatter: (date, locale) =>
                DateFormat.yMMMM(locale).format(date),
          ),
          pageAnimationEnabled: true,
          calendarStyle: CalendarStyle(
            defaultTextStyle: TextStyle(color: Colors.black, fontSize: 18.h),
            weekendTextStyle: TextStyle(color: Colors.red, fontSize: 18.h),
            outsideTextStyle: TextStyle(color: Colors.grey, fontSize: 18.h),
            todayTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18.h,
            ),
            todayDecoration: BoxDecoration(
              color: Colors.blue.shade300,
              shape: BoxShape.circle,
            ),
            selectedTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18.h,
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.red.shade300,
              shape: BoxShape.circle,
            ),
          ),
          availableGestures: AvailableGestures.horizontalSwipe,
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    if (index == value.length - 1) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 21.h,
                              vertical: 1.v,
                            ),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    '${value[index]}',
                                    style: TextStyle(
                                      fontSize: 18.h,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'ko_KR', symbol: '₩')
                                        .format(value[index].price),
                                    style: TextStyle(
                                      fontSize: 18.h,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 3.v,
                            margin: EdgeInsets.symmetric(
                              horizontal: 21.h,
                            ),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 21.h,
                              vertical: 1.v,
                            ),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    '총 금액',
                                    style: TextStyle(
                                      fontSize: 20.h,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    getTotalPriceOfTodayEvents(value),
                                    style: TextStyle(
                                      fontSize: 20.h,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 21.h,
                            vertical: 1.v,
                          ),
                          child: ListTile(
                            title: Row(
                              children: [
                                Text(
                                  '${value[index]}',
                                  style: TextStyle(
                                    fontSize: 18.h,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'ko_KR', symbol: '₩')
                                      .format(value[index].price),
                                  style: TextStyle(
                                    fontSize: 18.h,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 2.v,
                          margin: EdgeInsets.symmetric(
                            horizontal: 31.h,
                          ),
                          color: Colors.grey[300]!.withOpacity(0.9),
                        )
                      ],
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}

String getTotalPriceOfTodayEvents(List<Event> value) {
  int total = 0;
  for (var element in value) {
    total += element.price;
  }
  return NumberFormat.currency(locale: 'ko_KR', symbol: '₩').format(total);
}
