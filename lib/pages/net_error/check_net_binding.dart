import 'package:get/get.dart';

import 'check_net_logic.dart';

class CheckNetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoNetworkLogic());
  }
}
