import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_controller.dart';

class HomeLocationsPin extends StatelessWidget {
  final double right;
  final double top;
  final String region;
  HomeLocationsPin({
    required this.right,
    required this.top,
    required this.region,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Positioned(
        right: right,
        top: top,
        child: Container(
          width: 100,
          height: 100,
          child: MouseRegion(
            onEnter: (e) => homeController.onEntering(region),
            child: IconButton(
              icon: const Icon(
                Icons.location_on,
                shadows: <Shadow>[Shadow(color: Colors.yellowAccent, blurRadius: 15.0)],
                color: Colors.yellowAccent,
              ),
              onPressed: () {},
            ),
          ),
        )
    );
  }
}
