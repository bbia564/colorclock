import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ClockSettingLogic extends GetxController {

  int colorType = 0;
  bool needToShow = true;

  aboutClockPrivacy(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Privacy Policy"),
          ),
          body:const SafeArea(
            child: Markdown(data: """
#### Data Collection
Our apps do not collect any personal information or user data. All event logs are executed locally on the device and are not transmitted to any external server.

#### Cookie Usage
Our app does not use any form of cookies or similar technologies to track user behavior or personal information.

#### Data Security
User input data is only used for calculations on the user's device and is not stored or transmitted. We are committed to ensuring the security of user data.

#### Contact Information
If you have any questions or concerns about our privacy policy, please contact us via email.
          """),
          ),
        );
      },
    );
  }

  aboutClockUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 72,
        height: 72,
      ),
      children: [
        const Text(
            """We can provide you with a clock  """),
      ],
      context: context,
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    final para = Get.parameters;
    if (para.isNotEmpty) {
      colorType = int.parse(para['colorType'] ?? '0');
      needToShow = int.parse(para['needToShow'] ?? '1') == 1;
    }
    update();
    super.onInit();
  }

}
