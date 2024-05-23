import '../../../core/app_exports.dart';

class DateTimeController extends GetxController {
  late String dateTime;

  void setTime(DateTime date) {
    dateTime = date.toString();

    update();
  }
}
