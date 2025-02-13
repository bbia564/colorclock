import 'package:get/get.dart';

import 'clock_now_logic.dart';

class ClockNowBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
