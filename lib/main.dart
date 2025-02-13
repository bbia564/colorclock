import 'package:color_clock/pages/clock_main/clock_main_binding.dart';
import 'package:color_clock/pages/clock_main/clock_main_view.dart';
import 'package:color_clock/pages/clock_now/clock_now_binding.dart';
import 'package:color_clock/pages/clock_now/clock_now_view.dart';
import 'package:color_clock/pages/clock_setting/clock_setting_binding.dart';
import 'package:color_clock/pages/clock_setting/clock_setting_view.dart';
import 'package:color_clock/pages/events/event.dart';
import 'package:color_clock/pages/events/marry.dart';
import 'package:color_clock/pages/net_error/check_net_binding.dart';
import 'package:color_clock/pages/net_error/check_net_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

Color primaryColor = Colors.black;
Color bgColor = Colors.white;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  GetIt.instance.registerSingleton<Emitter>(Emitter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: NClock,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> NClock = [
  GetPage(name: '/', page: () => const ClockNowView(), binding: ClockNowBinding()),
  GetPage(name: '/clockMain', page: () => ClockMainPage(), binding: ClockMainBinding()),
  GetPage(name: '/clockMarry', page: () => const Marry()),
  GetPage(name: '/clockSetting', page: () => ClockSettingPage(), binding: ClockSettingBinding()),
  GetPage(name: '/net_error', page: () => CheckNetView(), binding: CheckNetBinding()),
];