import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../utils/constants.dart';

class HomeController extends GetxController {

  late VideoPlayerController videoController;
  String videoDir = 'images/home_intro.mp4';

  @override dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    videoController = VideoPlayerController.asset(
        videoDir
    )..initialize().then((_) {

    });
    videoController.setLooping(true);
    videoController.setVolume(0);
    videoController.play();
    super.onInit();
  }

  get videoPlayerController => videoController;
  get videoPlayerDir => videoDir;

}