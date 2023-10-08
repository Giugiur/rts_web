import 'package:flutter/material.dart';

class HomeScaffold extends StatefulWidget {
  final Widget body;

  const HomeScaffold({super.key, required this.body});

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();
  }
  bool iconTapped = false;
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Container(
                width: deviceSize.width,
                height: deviceSize.height,
                child: widget.body,
              ),
            ),
            AppBar(
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                child: GestureDetector(
                  onTap: _tapIcon,
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: _animationController,
                    size: 35,
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
    );
  }
}

