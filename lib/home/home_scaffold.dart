import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/auth/auth_controller.dart';
import 'package:rts_web/auth/auth_dropdown_menu.dart';
import 'package:rts_web/home/drawer/home_drawer_list_item.dart';
import '../marketplace/marketplace_filters.dart';
import '../utils/constants.dart';
import 'home_controller.dart';
import '../utils/utils.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class HomeScaffold extends StatelessWidget {
  final Widget body;

  HomeScaffold({super.key, required this.body});

  final authController = Get.put(AuthController());
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) =>
          AdvancedDrawer(
            backdrop: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black54,
            ),
            controller: _advancedDrawerController,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            animateChildDecoration: true,
            rtlOpening: false,
            openScale: 1.0,
            openRatio: isSmallScreen(context) ? 0.5 : 0.25,
            disabledGestures: false,
            childDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            drawer: SafeArea(
              child: ListTileTheme(
                textColor: Colors.white,
                iconColor: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 200.0,
                      height: 128.0,
                      margin: const EdgeInsets.only(
                        top: 24.0,
                        bottom: 24.0,
                      ),
                      child: Image.asset(
                        'images/long_logo.png',
                      ),
                    ),
                    HomeDrawerListItem(Get.currentRoute == HOME ? 0 : HOME, Icons.home, 'Home'),
                    const HomeDrawerListItem(MARKETPLACE, Icons.shopping_cart, 'Marketplace'),
                    const HomeDrawerListItem(1, Icons.edit_document, 'Whitepaper'),
                    const HomeDrawerListItem(2, Icons.search, 'Explore'),
                    const HomeDrawerListItem(3, Icons.people, 'Team'),
                    const Spacer(),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white54,
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: Text('Terms of Service | Privacy Policy'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            child: Scaffold(
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    SafeArea(
                      child: Container(
                        decoration: gradientDecoration,
                        width: deviceSize.width,
                        height: deviceSize.height,
                        child: body,
                      ),
                    ),
                    AppBar(
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                        child: IconButton(
                          onPressed: _handleMenuButtonPressed,
                          icon: ValueListenableBuilder<AdvancedDrawerValue>(
                            valueListenable: _advancedDrawerController,
                            builder: (_, value, __) {
                              return AnimatedSwitcher(
                                duration: const Duration(milliseconds: 250),
                                child: Icon(
                                  value.visible ? Icons.clear : Icons.menu,
                                  key: ValueKey<bool>(value.visible),
                                  size: 28,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      actions: [
                        Center(
                          child: Obx(() =>
                          authController.isUserSignedIn.value ? AuthDropdownMenu() :
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                            child: IconButton(
                              icon: const Icon(
                                Icons.login,
                                size: 28,
                              ),
                              onPressed: () => Get.toNamed(AUTH),
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              floatingActionButton: isSmallScreen(context) && Get.currentRoute == '/marketplace' ?
              Container(
                margin: const EdgeInsets.all(20),
                child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {
                      Get.bottomSheet(
                        const MarketplaceFilters(),
                      );
                    },
                    child: const Icon(
                      Icons.tune,
                      color: Colors.black,
                    )
                ),
              ) : Container(),
            ),
          ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}

