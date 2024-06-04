import 'package:tripmate/core/app_exports.dart';

class PackageDetailController extends GetxController {
  final RxBool _isDescriptionExpanded = false.obs;

  bool get isExpanded => _isDescriptionExpanded.value;
  void expandAndShrink() {
    _isDescriptionExpanded.value = !_isDescriptionExpanded.value;
  }
}
