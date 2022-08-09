import 'package:intl/intl.dart';

class AppFormat {
  static String date(String stringDate) {
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat('d MMM yyyy','id_ID').format(dateTime);//25 Jan 2004 or 5 Jan 2005
  }
}
