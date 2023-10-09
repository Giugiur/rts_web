import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'dart:ui_web';
import 'home_controller.dart';
import 'home_scaffold.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late VideoPlayerController _backgroundVideoController;
  late YoutubePlayerController _youtubeVideoController;

  void initState() {
    super.initState();
    String videoDir = 'videos/home_intro.mp4';

    _backgroundVideoController = VideoPlayerController.asset(
        videoDir
    )
      ..initialize().then((_) {
        setState(() {});
      });
    _backgroundVideoController.setLooping(true);
    _backgroundVideoController.setVolume(0);
    _backgroundVideoController.play();


    _youtubeVideoController = YoutubePlayerController.fromVideoId(
      videoId: 'ciFSSd39pAY',
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );

  }

  @override dispose() {
    _backgroundVideoController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) =>
        HomeScaffold(
          body: _backgroundVideoController.value.isInitialized ?
          Listener(
            onPointerSignal: (pointerSignal) => homeController.listenForScrolling(pointerSignal),
            child: Stack(
              children: [
                SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _backgroundVideoController.value.size.width ?? 0,
                      height: _backgroundVideoController.value.size.height ?? 0,
                      child: VideoPlayer(_backgroundVideoController),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: homeController.scrolledDown > 0  ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: SizedBox(
                        width: 370,
                        height: 208,
                        child: YoutubePlayer(
                          controller: _youtubeVideoController,
                          aspectRatio: 16 / 9,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: homeController.scrolledDown > 0  ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(50.0),
                      child: SizedBox(
                        child: Text(
                          'A free-to-play, AAA\n'
                          'RTS game, focused on\n'
                          'macro-management mechanics',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                    ),
                  ),
                ),
              ]
            )
          ) : Container()
        ),
    );
  }
}
