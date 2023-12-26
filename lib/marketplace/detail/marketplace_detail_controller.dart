import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rts_web/API/API.dart';
import 'package:rts_web/NFTs/NFTModel.dart';
import 'package:rts_web/NFTs/NFTs_controller.dart';
import 'package:rts_web/auth/auth_controller.dart';
import 'package:rts_web/utils/constants.dart';

class MarketplaceDetailController extends GetxController {

  NFTsController nftsController = Get.put(NFTsController());
  AuthController authController = Get.put(AuthController());
  late NFTModel assetDetail;
  late List<dynamic> passiveDescriptions = [];
  bool _isReady = false;
  var api = API();

  get isReady => _isReady;

  @override
  void onInit() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var id = Get.parameters['id'];
      List<NFTModel> nfts = await nftsController.getNFTs();
      assetDetail = nfts.firstWhere((nft) => nft.id == id);
      // TODo: Move it to a more general place so we avoid doing too many calls
      if (passiveDescriptions.isEmpty) {
        passiveDescriptions = await API().getPassives();
      }
      fillDescriptions(assetDetail);
      _isReady = true;
      update();
      super.onInit();
    });
  }

  void fillDescriptions(NFTModel assetDetail) {
    for (var passive in assetDetail.passives) {
      dynamic description = passiveDescriptions.firstWhere((description) => description['id'] == passive['name'], orElse: () => passive['description'] = 'No description found');
      if (description != 'No description found') {
        passive['description'] = description['data']['description'];
      }
    }
  }

  Future<void> mintWithCreditCard() async {
    if (authController.isUserSignedIn.value) {
      api.assetTemplateCheckout(assetDetail.id).then((response) {
        String url = json.decode(response.body)['url'];
        print(url);
        html.window.open(url, "_blank");
      });
    } else {
      Get.toNamed(AUTH);
    }
  }

}