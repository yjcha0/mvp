import 'dart:collection';
import 'dart:math';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;
  final int price;

  const Event(this.title, this.price);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

Map<DateTime, List<Event>> generateRandomEvents() {
  int numDaysWithEvents = Random().nextInt(5) + 5;
  List<int> numDaysBefore = [];
  for (int i = 0; i < numDaysWithEvents; i++) {
    int numDayBefore = Random().nextInt(40) + 1;
    while (numDaysBefore.contains(numDayBefore)) {
      numDayBefore = Random().nextInt(40) + 1;
    }
    numDaysBefore.add(numDayBefore);
  }

  Map<DateTime, List<Event>> events = <DateTime, List<Event>>{};
  for (var numDayBefore in numDaysBefore) {
    DateTime day =
        DateTime(kToday.year, kToday.month, kToday.day - numDayBefore);
    int numEvents = Random().nextInt(5) + 2;

    events[day] = [];
    for (int i = 0; i < numEvents; i++) {
      events[day]!.add(Event(
          '식비 ${events[day]!.length + 1}',
          (Random().nextInt(500) + 1) * 100 +
              (Random().nextInt(10) + 1) * 100));
    }
  }
  return events;
}

final _kEventSource = generateRandomEvents();

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year - 1, 1, 1);
final kLastDay = DateTime(kToday.year, kToday.month + 1, 0);
