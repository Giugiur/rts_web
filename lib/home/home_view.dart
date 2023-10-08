import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'home_controller.dart';
import 'home_scaffold.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late VideoPlayerController _controller;
  final homeController = HomeController();

  void initState() {
    super.initState();
    String videoDir = homeController.videoPlayerDir;

    _controller = VideoPlayerController.asset(
        videoDir
    )..initialize().then((_) {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.setVolume(0);
    _controller.play();
  }

  @override dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) =>
        HomeScaffold(
          body: _controller.value.isInitialized ?
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width ?? 0,
                  height: _controller.value.size.height ?? 0,
                  child: VideoPlayer(_controller),
                ),
              ),
            )
            : Container()
        ),
    );
  }
}
