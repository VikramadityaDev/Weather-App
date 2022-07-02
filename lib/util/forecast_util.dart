import 'package:intl/intl.dart';

class Util {
  static String appId ="dfb85803762c8fa8e5b0d9e99ac6e815";


  static String getFormattedDate(DateTime dateTime) {
    return new DateFormat("EEE, MMM d, y").format(dateTime);
  }


}