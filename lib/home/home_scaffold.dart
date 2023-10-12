import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                leading: Container(
                  margin: const EdgeInsets.only(top: 20, left: 20),
                  child: InkWell(
                    onTap: _tapIcon,
                    child: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: _animationController,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

