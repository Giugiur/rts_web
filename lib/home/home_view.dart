import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import 'home_scaffold.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) =>
        HomeScaffold(body: Container(color: Colors.red,)),
    );
  }
}
