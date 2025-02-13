import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:styled_widget/styled_widget.dart';

import '../events/event.dart';
import 'clock_setting_logic.dart';

class ClockSettingPage extends GetView<ClockSettingLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = [
      'Tell the time on time',
      'Switch colors',
      'About US - (1.0.0)'
    ];
    var hereBool = true;
    if (index == 0) {
      hereBool= controller.needToShow;
    } else if (index == 1) {
      hereBool = controller.colorType == 0;
    }
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        <Widget>[
          Visibility(
            visible: index < 2,
            child: Switch(
                value: hereBool,
                activeTrackColor: Colors.green,
                onChanged: (value) {
                  if (index == 0) {
                    controller.needToShow = value;
                  } else if (index == 1) {
                    controller.colorType = value ? 0 : 1;
                  }
                  controller.update();
                }),
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.end)
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (popInvoked, result) {
        Map map = {};
        map['colorType'] = controller.colorType;
        map['needToShow'] = controller.needToShow;
        final emitter = GetIt.instance<Emitter>();
        emitter.emit(Events.setting, map);
      },
      child: GetBuilder<ClockSettingLogic>(builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Setting"),
          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: <Widget>[
                        _item(0, context),
                        _item(1, context),
                        _item(2, context),
                      ].toColumn(
                          separator: Divider(
                            height: 15,
                            color: Colors.grey.withOpacity(0.3),
                          )),
                    ).decorated(
                        color: const Color(0xfff8f8f8),
                        borderRadius: BorderRadius.circular(12))
                  ].toColumn(),
                ).marginAll(15)),
          ),
        );
      }),
    );
  }
}
