import 'package:intl/intl.dart';

String humanFormatDate(String timestamp) {
  DateTime dateTime = DateTime.parse(timestamp);
  DateFormat formatter = DateFormat('MMMM dd, yyyy | hh:mm a');
  String formatted = formatter.format(dateTime);
  return formatted;
}
