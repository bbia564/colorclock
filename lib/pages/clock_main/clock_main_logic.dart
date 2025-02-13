import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../events/event.dart';

class ClockMainLogic extends GetxController {

  int colorType = 0;
  bool needToShow = true;

  Timer? _timer;
  var hmString = '-'.obs;
  var amPMString = '-'.obs;
  var msString = '-'.obs;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      hmString.value = DateFormat('HH:mm').format(now);
      amPMString.value = DateFormat('a').format(now);
      msString.value = DateFormat('ss').format(now);
      if (isTopOfTheHour(now) && needToShow) {
        Fluttertoast.showToast(msg: '''${now.hour} o'clock sharp''');
      }
    });
  }

  bool isTopOfTheHour(DateTime dateTime) {
    return dateTime.minute == 0 && dateTime.second == 0 && dateTime.millisecond == 0;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    startTimer();
    final emitter = GetIt.instance<Emitter>();
    emitter.on(Events.setting, (v) {
      final result = v as Map;
      colorType = result['colorType'];
      needToShow = result['needToShow'];
      update();
    });
    super.onInit();
  }


}
