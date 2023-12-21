import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/auth/auth_controller.dart';
import 'package:rts_web/auth/auth_dropdown_menu.dart';
import '../marketplace/marketplace_filters.dart';
import '../utils/constants.dart';
import 'home_controller.dart';
import '../utils/utils.dart';

class HomeScaffold extends StatefulWidget {
  final Widget body;

  const HomeScaffold({super.key, required this.body});

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool iconTapped = false;
  final authController = Get.put(AuthController());

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();
  }

  void _tapIcon() {
    if (iconTapped) {
      _animationController.reverse();
      iconTapped = false;
    } else {
      _animationController.forward();
      iconTapped = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) => Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SafeArea(
                child: Container(
                  decoration: gradientDecoration,
                  width: deviceSize.width,
                  height: deviceSize.height,
                  child: widget.body,
                ),
              ),
              AppBar(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: InkWell(
                    onTap: _tapIcon,
                    child: Center(
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: _animationController,
                        size: 36,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, right: 15),
                    child: Obx(() =>
                      authController.isUserSignedIn.value ? AuthDropdownMenu() :
                      IconButton(
                        icon: const Icon(
                          Icons.login,
                          size: 32,
                        ),
                        onPressed: () => Get.toNamed(AUTH),
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
    );
  }
}

