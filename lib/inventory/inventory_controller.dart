import 'dart:convert';

import 'package:get/get.dart';
import 'package:rts_web/NFTs/NFTs_controller.dart';
import 'package:rts_web/auth/auth_controller.dart';
import 'package:rts_web/NFTs/NFTModel.dart';

import '../API/API.dart';
import '../utils/utils.dart';

class InventoryController extends GetxController {

  List<NFTModel> displayList = [];
  final authController = Get.put(AuthController());
  final nftsController = Get.put(NFTsController());
  var api = API();

  @override
  void onInit() async{
    // if (authController.isUserSignedIn.value) {
    //   //TODO: Handle more than 1 page or 50 items
    //   var assets = await api.getUserAssets(authController.authUID);
    //   var decoded = json.decode(assets.body);
    //   displayList.value = decoded['data'];
    // }
    super.onInit();
  }

  void getUserAssets() async {
    if (authController.isUserSignedIn.value) {
      //TODO: Handle more than 1 page or 50 items
      // var assets = await api.getUserAssets(authController.authUID);
      // var decoded = json.decode(assets.body);
      // extract ID,
      // match ID with NFT data
      // display only those NFT
      // print(decoded['data']);
      // for (var item in decoded['data']) {
      //   displayList.add(nftsController.buildNFTModel(item));
      // }
      displayList = await nftsController.getNFTs();
      update();
    }

  }
}