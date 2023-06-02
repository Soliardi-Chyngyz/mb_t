import 'package:intl/intl.dart';

mixin TimeManager {
  String getTime(String date) {
    final time =
        DateFormat.Hm().format(DateFormat('yyyy-MM-dd HH:mm').parse(date));
    return time;
  }

  String formatDateTime(String? date) {
    return DateFormat('dd.MM.yyyy HH:mm').format(
      DateTime.parse(date ?? ''),
    );
  }

  double timeDifferenceByHours(String startAt, String finishAt) {
    final start = DateFormat('HH:mm').parse(startAt);
    final finish = DateFormat('HH:mm').parse(finishAt);
    final s = finish.difference(start);
    return s.inMinutes / 60;
  }
}
