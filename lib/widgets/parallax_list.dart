import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'hero_button.dart';
import '../utils/constants.dart';

class ParallaxList extends StatefulWidget {
  const ParallaxList({super.key});

  @override
  State<ParallaxList> createState() => _ParallaxListState();
}

class _ParallaxListState extends State<ParallaxList> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return  ListView.builder(
      controller: _controller,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          height: deviceSize.height,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Container(
              transform: Matrix4.identity()..translate(0.0, _controller.hasClients ? (-(index * deviceSize.height) + _controller.position.pixels) : 0.0),
              height: deviceSize.height,
              width: deviceSize.width,
              child: Image.asset(
                'images/${index + 1}.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
