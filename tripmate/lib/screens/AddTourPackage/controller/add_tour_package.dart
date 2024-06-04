import '../../../core/app_exports.dart';

class AddTourPackageController extends GetxController {
  String dateTime = '';
  String endDate = '';
  bool isChecked = false;
  bool isEndDateClicked = false;

  void setStartTime(DateTime date) {
    dateTime = date.toString();
    isChecked = true;
    update();
  }

  void setEndTime(DateTime date) {
    endDate = date.toString();
    isEndDateClicked = true;
    update();
  }
}
