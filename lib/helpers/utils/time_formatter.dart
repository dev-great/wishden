String formatTimeDifference(String isoDateTime) {
  DateTime dateTime = DateTime.parse(isoDateTime);
  DateTime now = DateTime.now();
  Duration difference = now.difference(dateTime);

  // Calculating years, months, weeks, days, hours, minutes, and seconds
  int years = difference.inDays ~/ 365;
  int months = (difference.inDays % 365) ~/ 30;
  int weeks = (difference.inDays % 365 % 30) ~/ 7;
  int days = difference.inDays % 365 % 30 % 7;
  int hours = difference.inHours % 24;
  int minutes = difference.inMinutes % 60;
  int seconds = difference.inSeconds % 60;

  String timeAgo = '';

  if (years > 0) {
    timeAgo += '$years ${years == 1 ? 'yr' : 'yr'} ';
    return timeAgo;
  }
  if (months > 0) {
    timeAgo += '$months ${months == 1 ? 'mo' : 'mo'} ';
    return timeAgo;
  }
  if (weeks > 0) {
    timeAgo += '$weeks ${weeks == 1 ? 'wk' : 'wk'} ';
    return timeAgo;
  }
  if (days > 0) {
    timeAgo += '$days ${days == 1 ? 'd' : 'd'} ';
    return timeAgo;
  }
  if (hours > 0) {
    timeAgo += '$hours ${hours == 1 ? 'h' : 'h'} ';
    return timeAgo;
  }
  if (minutes > 0) {
    timeAgo += '$minutes ${minutes == 1 ? 'm' : 'm'} ';
    return timeAgo;
  }
  if (seconds > 0) {
    timeAgo += '$seconds ${seconds == 1 ? 's' : 's'} ';
    return timeAgo;
  }

  if (timeAgo.isNotEmpty) {
    return timeAgo;
  } else {
    return 'just now';
  }
}

String pickMonthYear(String isoDateTime) {
  DateTime dateTime = DateTime.parse(isoDateTime);
  final months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  return '${months[dateTime.month - 1]} ${dateTime.year}';
}
