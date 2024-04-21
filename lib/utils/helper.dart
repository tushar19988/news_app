String agoTime(String? utcTimeString) {
  if (utcTimeString == null) {
    return 'UTC time string is null.';
  }

  DateTime utcTime = DateTime.parse(utcTimeString);
  DateTime localTime = utcTime.toLocal();
  DateTime now = DateTime.now();

  Duration difference = now.difference(localTime);

  if (difference.inDays > 6) {
    int weeks = difference.inDays ~/ 7;
    return '$weeks weeks ago';
  } else if (difference.inDays > 0) {
    return '${difference.inDays} days ago';
  } else {
    int hours = difference.inHours;
    if (hours >= 24) {
      int days = hours ~/ 24;
      return '$days days ago';
    } else {
      return '$hours hours ago';
    }
  }
}
