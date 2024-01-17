import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/widgets/fade_in_container.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../utils/constants.dart';
import '../utils/parallax_list.dart';
import '../widgets/hero_button.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'home_controller.dart';

class HomeIntroSection extends StatefulWidget {
  const HomeIntroSection({super.key});

  @override
  State<HomeIntroSection> createState() => _HomeIntroSectionState();
}

class _HomeIntroSectionState extends State<HomeIntroSection> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) => FadeInContainer(
      visibility: homeController.introSectionVisible,
      child: SizedBox(
        height: deviceSize.height,
        width: deviceSize.width,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Text(
                    'A Web3, free-to-play,\n'
                        'AAA, RTS game, focused on\n'
                        'macro-management mechanics',
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 50,),
                HeroButton(
                  label: 'Sign Up',
                  onTap: () => Get.toNamed(AUTH),
                ),
              ],
            ),
          ),
        ),
      ))
    );
  }
}

// _backgroundVideoController.value.isInitialized ?
//   Stack(
//     children: [
//       SizedBox.expand(
//         child: FittedBox(
//           fit: BoxFit.cover,
//           child: SizedBox(
//             width: _backgroundVideoController.value.size.width ?? 0,
//             height: _backgroundVideoController.value.size.height ?? 0,
//             child: VideoPlayer(_backgroundVideoController),
//           ),
//         ),
//       ),
//       // AnimatedOpacity(
//       //   opacity: homeController.scrolled ? 1.0 : 0.0,
//       //   duration: const Duration(milliseconds: 500),
//       //   child: Align(
//       //     alignment: Alignment.bottomRight,
//       //     child: Padding(
//       //       padding: const EdgeInsets.all(introPadding),
//       //       child: SizedBox(
//       //         width: 370,
//       //         height: 208,
//       //         child: YoutubePlayer(
//       //           controller: _youtubeVideoController,
//       //           aspectRatio: 16 / 9,
//       //         ),
//       //       ),
//       //     ),
//       //   ),
//       // ),
//       AnimatedOpacity(
//         opacity: homeController.scrolled ? 1.0 : 0.0,
//         duration: const Duration(milliseconds: 500),
//         child: Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//             height: 300,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   child: Text(
//                     'A Web3, free-to-play,\n'
//                     'AAA, RTS game, focused on\n'
//                     'macro-management mechanics',
//                     style: Theme.of(context).textTheme.headlineLarge,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 const SizedBox(height: 50,),
//                 HeroButton(
//                   label: 'Sign Up',
//                   onTap: () => Get.toNamed(AUTH),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ]
// ) : Container()
