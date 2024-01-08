import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import '../widgets/hero_button.dart';
import 'home_controller.dart';

class HomeIntroSection extends StatefulWidget {
  const HomeIntroSection({super.key});

  @override
  State<HomeIntroSection> createState() => _HomeIntroSectionState();
}

class _HomeIntroSectionState extends State<HomeIntroSection> {
  late VideoPlayerController _backgroundVideoController;
  late YoutubePlayerController _youtubeVideoController;

  @override
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
    final deviceSize = MediaQuery.of(context).size;
    const double introPadding = 30.0;
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) => SizedBox(
      width: deviceSize.width,
      height: deviceSize.height,
      child: _backgroundVideoController.value.isInitialized ?
        Stack(
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
              opacity: homeController.scrolled ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(introPadding),
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
              opacity: homeController.scrolled ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: HeroButton(
                    label: 'Marketplace',
                    onTap: () {},
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: homeController.scrolled ? 1.0 : 0.0,
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
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    )
                ),
              ),
            ),
          ]
        ) : Container()
      )
    );
  }
}
