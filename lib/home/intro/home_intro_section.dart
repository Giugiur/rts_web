import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:rts_web/widgets/fade_in_container.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../utils/constants.dart';
import '../../widgets/parallax_list.dart';
import '../../widgets/hero_button.dart';
import '../home_controller.dart';

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
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 0),
        height: deviceSize.height,
        width: deviceSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/long_logo.png',
              width: 450,
            ),
            Spacer(),
            SizedBox(
              child: Text(
                'A Web3, free-to-play,\n'
                    'AAA, RTS game, focused on\n'
                    'macro-management mechanics\n'
                'and custom experiences built in UE5',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25,),
            HeroButton(
              label: 'Sign Up',
              onTap: () => Get.toNamed(AUTH),
            ),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(FontAwesome5Brands.twitter)),
                const SizedBox(width: 20,),
                IconButton(onPressed: () {}, icon: const Icon(FontAwesome5Brands.discord)),
                const SizedBox(width: 20,),
                IconButton(onPressed: () {}, icon: const Icon(FontAwesome.medium)),
              ],
            )
          ],
        ),
        // child: Align(
        //   alignment: Alignment.bottomCenter,
        //   child: Container(
        //     height: 400,
        //     padding: const EdgeInsets.only(bottom: 50),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         SizedBox(
        //           child: Text(
        //             'A Web3, free-to-play,\n'
        //                 'AAA, RTS game, focused on\n'
        //                 'macro-management mechanics',
        //             style: Theme.of(context).textTheme.headlineLarge,
        //             textAlign: TextAlign.center,
        //           ),
        //         ),
        //         const SizedBox(height: 50,),
        //         HeroButton(
        //           label: 'Sign Up',
        //           onTap: () => Get.toNamed(AUTH),
        //         ),
        //         const SizedBox(height: 50,),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             IconButton(onPressed: () {}, icon: Icon(FontAwesome5Brands.twitter)),
        //             const SizedBox(width: 20,),
        //             IconButton(onPressed: () {}, icon: Icon(FontAwesome5Brands.discord)),
        //             const SizedBox(width: 20,),
        //             IconButton(onPressed: () {}, icon: Icon(FontAwesome.medium)),
        //           ],
        //         )
        //       ],
        //     ),
        //   ),
        // ),
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
