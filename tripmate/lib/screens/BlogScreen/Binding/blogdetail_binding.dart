import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/BlogScreen/Controller/blogcontroller.dart';

class BlogDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlogController());
  }
}
