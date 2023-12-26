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
    if (authController.isUserSignedIn.value) {
      //TODO: Handle more than 1 page or 50 items
      getUserAssets();
    }
    super.onInit();
  }

  void getUserAssets() async {
      //TODO: Handle more than 1 page or 50 items
      var assets = await api.getUserAssets(authController.authUID);
      var userAssets = json.decode(assets.body);
      List<NFTModel> nftList = List.from(await nftsController.getNFTs());
      print(userAssets['data']);
      nftList.removeWhere((nft) {
        bool found = false; int i = 0;
        while(i< userAssets['data'].length && !found) {
          print('nft ID: '); print(nft.name);
          print('asset ID: '); print(userAssets['data'][i]['name']);
          if (userAssets['data'][i]['name'] == nft.name) {
            found = true;
          }
          i++;
        }
        return !found;
      });
      displayList = nftList;
      update();
    }
}