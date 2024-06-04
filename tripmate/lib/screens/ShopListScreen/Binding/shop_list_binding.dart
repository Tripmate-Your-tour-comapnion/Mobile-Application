import "../../../core/app_exports.dart";
import "../controller/shop_list_controller.dart";

class ShopListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShopListController());
  }
}
