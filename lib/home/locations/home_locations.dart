import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/home/home_controller.dart';
import 'package:rts_web/home/locations/home_locations_highlight.dart';
import 'home_locations_pin.dart';


class HomeLocations extends StatelessWidget {
  HomeLocations({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 75,
          child: Container(
            width: deviceSize.width,
            height: deviceSize.height,
            child:  Center(
              child: switch (homeController.hoveringOver) {
                '' => HomeLocationsHighlight(0),
                'the_guilds' => HomeLocationsHighlight(1),
                'spiros' => HomeLocationsHighlight(2),
                Object() => null,
                null => null,
              },
            ),
          ),
        ),
        Expanded(
          flex: 25,
          child: Container(
            width: deviceSize.width,
            height: deviceSize.height,
            child: Stack(
              children: [
                Image.asset(
                  'images/the_known_world.png',
                  fit: BoxFit.fitHeight,
                ),
                HomeLocationsPin(
                  right: 340,
                  top: 0,
                  region: 'the_guilds'
                ),
                HomeLocationsPin(
                    right: 15,
                    top: 20,
                    region: 'spiros'
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

