import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

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
                child: SizedBox(
                  width: deviceSize.width,
                  height: deviceSize.height,
                  child: widget.body,
                ),
              ),
              AppBar(
                toolbarHeight: 100,
                leading: Container(
                  margin: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: _tapIcon,
                    child: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: _animationController,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                // actions: [
                //   Container(
                //     margin: const EdgeInsets.symmetric(horizontal: 20),
                //     child: TextButton(
                //       onPressed: () {},
                //       child: Row(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           Text(
                //             'Marketplace'.toUpperCase(),
                //             style: Theme.of(context).textTheme.labelLarge,
                //           ),
                //           const SizedBox(
                //             width: 5,
                //           ),
                //           const Icon(
                //             Icons.double_arrow,
                //             size: 24.0,
                //             color: Colors.white,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ],
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

