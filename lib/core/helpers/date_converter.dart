import 'package:intl/intl.dart';

class DateHelper {
  static String formatHistoryDate(DateTime date) {
    // MMM = Oct, dd = 24, yyyy = 2023
    return DateFormat('MMM dd, yyyy').format(date).toUpperCase();
  }
}
