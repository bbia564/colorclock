import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'clock_main_logic.dart';

class ClockMainPage extends GetView<ClockMainLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: null,
        actions: [
          const Icon(
            Icons.settings,
            size: 25,
            color: Color(0xffbfbfbf),
          ).marginOnly(right: 20).gestures(onTap: () {
            Get.toNamed('/clockSetting', parameters: {
              'colorType': controller.colorType.toString(),
              'needToShow': controller.needToShow ? '1' : '0'
            });
          })
        ],
      ),
      body: GetBuilder<ClockMainLogic>(builder: (_) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: Center(
              child: <Widget>[
                Obx(() {
                  return Text(
                    controller.hmString.value,
                    style: TextStyle(
                        fontSize: 150,
                        color: controller.colorType == 0
                            ? Colors.black
                            : Colors.white,
                        fontWeight: FontWeight.bold),
                  );
                }),
                const SizedBox(
                  width: 20,
                ),
                <Widget>[
                  Obx(() {
                    return Text(
                      controller.amPMString.value,
                      style: TextStyle(
                          fontSize: 32,
                          color: controller.colorType == 0
                              ? Colors.black
                              : Colors.white,
                          fontWeight: FontWeight.bold),
                    );
                  }),
                  Obx(() {
                    return Text(
                      controller.msString.value,
                      style: TextStyle(
                          fontSize: 85,
                          color: controller.colorType == 0
                              ? Colors.black
                              : Colors.white,
                          fontWeight: FontWeight.bold),
                    );
                  })
                ].toColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center)
              ].toRow(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center),
            ),
          ),
        ).decorated(
            color: controller.colorType == 0 ? Colors.white : Colors.black);
      }),
    );
  }
}
