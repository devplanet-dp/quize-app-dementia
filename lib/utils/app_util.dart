import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class AppUtil {
  Future dummyTask() async {
    Future.delayed(const Duration(seconds: 10), () {
      return true;
    });
  }

  static String getDayFormat(DateTime dateTime) {
    initializeDateFormatting();
    return DateFormat.EEEE('si-LK').format(dateTime);
  }
}
