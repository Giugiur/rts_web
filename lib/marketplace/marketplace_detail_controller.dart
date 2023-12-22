import 'package:get/get.dart';

class MarketplaceDetailController extends GetxController {

  @override
  void onInit() {
    var id = Get.parameters['id'];
    print(id);
    super.onInit();
  }
}