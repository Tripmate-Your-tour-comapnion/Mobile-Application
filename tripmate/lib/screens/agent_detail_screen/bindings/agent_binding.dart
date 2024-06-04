import 'package:tripmate/core/app_exports.dart';

import '../controller/agent_controller.dart';

class AgentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AgentController());
  }
}
