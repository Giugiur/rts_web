import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/marketplace/marketplace_view.dart';
import 'home/home_view.dart';
import 'splash_screen/splash_screen_view.dart';
import 'utils/constants.dart';
import 'utils/theme.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const RtsWebApp());
}

class RtsWebApp extends StatelessWidget {
  const RtsWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wartorn',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: const SplashScreen(),
      getPages: [
        GetPage(name: HOME, page: () => const HomeView(), transition: Transition.fadeIn),
        GetPage(name: MARKETPLACE, page: () => const MarketplaceView(), transition: Transition.fadeIn),
      ]
    );
  }
}
