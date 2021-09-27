import 'package:intl/intl.dart';

final defaultDateFormat = DateFormat('MM/dd/yyyy');
final defaultTimeFormat = DateFormat('h:mm aa');

String formatDate(DateTime dateTime) {
  return defaultDateFormat.format(dateTime);
}
